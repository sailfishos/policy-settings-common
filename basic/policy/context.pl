:- module(context, [update_contexts/1]).


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

% # call context predicate
context_variable(call, Entry) :-
	call_state(State),
	set_context_variable_and_value(call, State, Entry).

% bluetooth_override context value
context_variable(bluetooth_override, Entry) :-
	bluetooth_override_state(State),
	set_context_variable_and_value(bluetooth_override, State, Entry).



% #############################################################################
% #                        ### helper predicates ###                          #
% #############################################################################

set_context_variable_and_value(Variable, Value, Entry) :-
	Entry = [context, [variable, Variable], [value, Value]].
