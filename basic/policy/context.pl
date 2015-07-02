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

call_state(inactive) :- 
% #	\+call_state(active),	% # Commented out unnecessary checks. active and 
% # \+call_state(ringing),	% # ringing have already been checked as false.
	!.

call_state_all(any) :-
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
	alien_application_pid(AlienPid),
	active_application_pid(Pid),
	(call_state_all(any) *-> Value=inactive ;
		((AlienPid>0, AlienPid=:=Pid) -> Value=active ;
			(granted_resource(_, audio_playback) *->
				(resource_set_pid_granted(Pid, audio_playback) -> Value=active ; Value=background) ;
				(resource_set_pid_registered(Pid, audio_playback) *-> Value=foreground ; Value=inactive)))).

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


% #############################################################################
% #                        ### helper predicates ###                          #
% #############################################################################

active_application_pid(Pid) :-
	fact_exists('com.nokia.policy.active_application', [pid], [Pid]),
	not(Pid = 0).

alien_application_pid(Pid) :-
	fact_exists('com.nokia.policy.alien_application', [pid], [Pid]),
	not(Pid = 0).

set_context_variable_and_value(Variable, Value, Entry) :-
	Entry = [context, [variable, Variable], [value, Value]].
