:- module(context, [update_contexts/1, call_state/1]).


% # Our predicates for the rule engine.
rules([update_contexts/1]).

% #
% # exported predicates
% #

update_contexts(ContextList) :-
	findall(X, context_variable(_,X), ContextList).

% #############################################################################
% # com.nokia.policy.context (   variable = "call",                           #
% #                              value = [active|ringing|inactive] )          #   
% #############################################################################

% # call state(value) can be active, ringing or inactive
call_state(active) :- 
	telephony:has_active_call,!;
 	telephony:has_active_video_call,!;
	telephony:has_held_call,!.

call_state(incoming) :-
	telephony:has_alerting_call,!.      % # incoming created call

call_state(outgoing) :-
	telephony:has_outgoing_call,!.      % # outgoing created call

call_state(voip) :-
	audio_resource_has_owner(aliencall),!.

call_state(inactive) :- 
% #	\+call_state(active),	% # Commented out unnecessary checks. active and 
% # \+call_state(ringing),	% # ringing have already been checked as false.
	!.

call_state_all(any) :-
	call_state(voip) ;
	call_state(active) ;
	call_state(incoming) ;
	call_state(outgoing),!.

bt_override(any) :-
	audio_route:bluetooth_override(A),
	not(A = default).

bluetooth_override_state(Value) :-
	(call_state_all(any) *->
		(bt_override(any) *-> Value=active ; Value=inactive) ;
		Value=disabled).

% if call is ongoing -> inactive
% if alien application is defined and topmost -> active
% if resources are granted AND the app is topmost -> active
% if resources are granted AND the app is not topmost -> background
% if resources are not granted AND the app is topmost -> foreground
% else inactive
media_playing_state(Value) :-
	policy_active_appsupport(AppsupportId),
	policy_active_application(AppId),
	(call_state_all(any) *-> Value=inactive ;
		((AppsupportId == AppId) -> Value=active ;
			(granted_resource(_, audio_playback) *->
				(resource_set_app_id_granted(AppId, audio_playback) -> Value=active ; Value=background) ;
				(resource_set_app_id_registered(AppId, audio_playback) *-> Value=foreground ; Value=inactive)))).

% if voicecall source is selectable, and
% if call is ongoing -> enabled
% otherwise disabled
voicecall_record_state(Value) :-
	voicecall_device_selectable(1) *-> (call_state_all(any) *-> Value=enabled ; Value=disabled) ;
	                                   Value=disabled.

emergency_call_state(Value) :-
	is_emergency_call *-> Value=active ; Value=inactive.

% # call context predicate
context_variable(call, Entry) :-
	call_state(State),
	set_context_variable_and_value(call, State, Entry).

% bluetooth_override context value
context_variable(bluetooth_override, Entry) :-
	bluetooth_override_state(State),
	set_context_variable_and_value(bluetooth_override, State, Entry).

% media_state context value
context_variable(media_state, Entry) :-
	media_playing_state(State),
	set_context_variable_and_value(media_state, State, Entry).

% voicecall_record context value
context_variable(voicecall_record, Entry) :-
	voicecall_record_state(State),
	set_context_variable_and_value(voicecall_record, State, Entry).

context_variable(emergency_call, Entry) :-
	emergency_call_state(State),
	set_context_variable_and_value(emergency_call, State, Entry).

% #############################################################################
% #                        ### helper predicates ###                          #
% #############################################################################

voicecall_record_value(A) :-
	fact_exists('com.nokia.policy.voicecall_record', [value], [A]),
	not(A = disabled).

voicecall_device_selectable(A) :-
	fact_exists('com.nokia.policy.audio_device_selectable', [name, selectable], [voicecall, A]),
	not(A = 0).

policy_active_appsupport(AppId) :-
	fact_exists('com.nokia.policy.policy_active_appsupport', [id], [AppId]),
	not(AppId = "none").

policy_active_application(AppId) :-
	fact_exists('com.nokia.policy.policy_active_application', [id], [AppId]),
	not(AppId = "none").

audio_resource_has_owner(Name) :-
	fact_exists('com.nokia.policy.audio_resource_owner', [previous, current], [_, Name]).

set_context_variable_and_value(Variable, Value, Entry) :-
	Entry = [context, [variable, Variable], [value, Value]].
