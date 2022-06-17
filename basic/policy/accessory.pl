:- module(accessory,
    [update_accessible_video_entry/3, update_selectable_video_entry/3,
     update_accessible_audio_entry/4, update_selectable_audio_entry/4,
     selectable_video/1, selectable_audio/1, update_accessory_mode/3,
     accessible_audio/1, preferred_audio/1,
     set_preferred_audio_entry/3, update_preferred_audio_entry/1,
     clear_preferred_audio_entry/1]).


rules([update_accessible_video_entry/3, update_selectable_video_entry/3,
       update_accessible_audio_entry/4, update_selectable_audio_entry/4,
       update_accessory_mode/3,
       set_preferred_audio_entry/3, update_preferred_audio_entry/1,
       clear_preferred_audio_entry/1]).



/*
 * update_accessible_video_entry
 */
update_accessible_video_entry(Accessory, ConnState, List) :-
    ConnState >= 0, video_accessory(Accessory) *->
        List = [[accessible_video, [name, Accessory], [connected, ConnState]]]
    ;
        List = [].

/*
 * update_selectable_video_entry
 */
selectable_video_accessory(Exclude, Accessory) :-
    video_accessory(Accessory),
    not(Exclude == Accessory),
    accessible_video(Accessory).

first_selectable_video_accessory(Exclude, Accessory) :-
    (ground(Exclude); Exclude = undefined),
    (selectable_video_accessory(Exclude, Accessory), !
     ;
     Accessory = undefined
    ).


selectable_video_entry_list_elem(Accessory, Selectable, Elem) :-
    Elem = [selectable_video, [name, Accessory], [selectable, Selectable]]
      ;
    (twin_video_device(Accessory, TwinDevice),
     Elem = [selectable_video, [name, TwinDevice], [selectable, Selectable]]
    ).

selectable_video_entry(Accessory, 1, Entry) :-
    (ground(Accessory),
     accessible_video(Accessory),
     selectable_video_entry_list_elem(Accessory, 1, Entry)
    )
    ;
    (accessory_exclude(Accessory, OtherAccessory),
     video_accessory(OtherAccessory),
     selectable_video_entry_list_elem(OtherAccessory, 0, Entry)
    ).

selectable_video_entry(Accessory, 0, Entry) :-
    (ground(Accessory),
     video_accessory(Accessory),
     selectable_video_entry_list_elem(Accessory, 0, Entry)
    )
    ;
    (first_selectable_video_accessory(Accessory, TopPriorityAccessory),
     video_accessory(OtherAccessory),
     not(OtherAccessory = Accessory),
     (OtherAccessory = TopPriorityAccessory *->
          selectable_video_entry_list_elem(OtherAccessory, 1, Entry)
      ;
          selectable_video(OtherAccessory),
          selectable_video_entry_list_elem(OtherAccessory, 0, Entry)
     )
    ).

update_selectable_video_entry(Accessory, ConnState, List) :-
    accessory(Accessory),
    ConnState >= 0 *->
        findall(E, selectable_video_entry(Accessory, ConnState, E), List)
    ;
        List = [].


/*
 * set_preferred_audio_entry
 *
 * Set preferred audio entry to 1 if accessory with the same name is
 * selectable.
 */
preferred_audio_entry_list_elem(Accessory, Value, Elem) :-
    Elem = [preferred_audio, [name, Accessory], [preferred, Value]].

commonname_to_accessory_name(Common, Name) :-
    fact_exists('com.nokia.policy.audio_output_configuration',
        [device, mode, hwid, type, commonname],
        [Name, _, _, _, Common]).

preferred_audio_entry(CommonName, ReqState, Elem) :-
    commonname_to_accessory_name(CommonName, Accessory),
    audio_device_selectable(Accessory, Selectable),
    NewValue is ReqState /\ Selectable,
    preferred_audio_entry_list_elem(Accessory, NewValue, Elem).

set_preferred_audio_entry(CommonName, ReqState, List) :-
    commonname_to_accessory_name(CommonName, _) *->
        findall(E, preferred_audio_entry(CommonName, ReqState, E), List)
    ;
        List = [].

/*
 * update_preferred_audio_entry
 *
 * Reset all preferred entries to 0 if accessory is not selectable.
 */
preferred_allowed_entry(Elem) :-
    audio_device_preferred(Accessory, 1),
    audio_device_selectable(Accessory, 0),
    preferred_audio_entry_list_elem(Accessory, 0, Elem).

update_preferred_audio_entry(List) :-
    audio_device_preferred(_, 1) *->
        findall(E, preferred_allowed_entry(E), List)
    ;
        List = [].

/*
 * clear_preferred_audio_entry/1
 *
 * Set all preferred audio entries with value 1 to 0.
 */
clear_preferred_all(Elem) :-
    audio_device_preferred(Accessory, 1),
    preferred_audio_entry_list_elem(Accessory, 0, Elem).

clear_preferred_audio_entry(List) :-
    audio_device_preferred(_, 1) *->
        findall(E, clear_preferred_all(E), List)
    ;
        List = [].

/*
 * update_accessible_audio_entry
 */
new_audio_driver_state(Accessory, ReqDriverState, NewDriverState) :-
    ((ground(ReqDriverState), !); ReqDriverState = -1),
    (ReqDriverState < 0 *->
         audio_driver_state(Accessory, NewDriverState)
     ;
         NewDriverState = ReqDriverState
    ).

new_audio_connect_state(Accessory, ReqConnectState, NewConnectState) :-
    ((ground(ReqConnectState), !) ; ReqConnectState = -1),
    (ReqConnectState < 0 *->
         audio_connected_state(Accessory, NewConnectState)
     ;
         NewConnectState = ReqConnectState
    ).

update_accessible_audio_entry(Accessory, DriverState, ConnectState, List) :-
    audio_accessory(Accessory) *->
        new_audio_driver_state(Accessory, DriverState, D),
	new_audio_connect_state(Accessory, ConnectState, C),
        List = [[accessible_audio, [name, Accessory], 
		                   [driver, D],
		                   [connected, C]
	       ]]
    ;
        List = [].

/*
 * update_selectable_audio_entry
 */
accessible_audio_accessory(Exclude, Accessory) :-
    audio_accessory(Accessory),
    not(Exclude == Accessory),
    accessible_audio(Accessory).

first_accessible_audio_accessory(Exclude, SinkOrSource, Accessory) :-
    (ground(Exclude); Exclude = undefined),
    (accessible_audio_accessory(Exclude, Accessory),
     audio_device_type(SinkOrSource, Accessory), !
     ;
     Accessory = undefined
    ).

top_priority_accessory(Exclude, SinkOrSource, Accessory) :-
    audio_device_type(SinkOrSource),
    first_accessible_audio_accessory(Exclude, SinkOrSource, Accessory).

selectable_audio_entry_list_elem(Accessory, Selectable, Elem) :-
    Elem = [selectable_audio, [name, Accessory], [selectable, Selectable]]
     ;
    (twin_audio_device(Accessory, Twin, TwinDevice),
     accessible_audio(Twin),
     Elem = [selectable_audio, [name, TwinDevice], [selectable, Selectable]]
    )
     ;
    (slave_audio_device(Accessory, Slave, SlaveDevice),
     accessible_audio(Slave),
     Elem = [selectable_audio, [name, SlaveDevice], [selectable, Selectable]]
    )
    ;
    (call_audio_device(Accessory, CallDevice),
     Elem = [selectable_audio, [name, CallDevice], [selectable, Selectable]]
    ).

%
% if an Accessory become selectable we return the corresponding entry
% as selective and for all the other accessible accessories a non-selectable
% entry
% 
selectable_audio_entry(Accessory, 1, Entry) :-
    (ground(Accessory),
     accessible_audio(Accessory),
     selectable_audio_entry_list_elem(Accessory, 1, Entry)
    )
    ;
    (selectable_audio(OtherAccessory),
     accessory_exclude(Accessory, OtherAccessory),
     selectable_audio_entry_list_elem(OtherAccessory, 0, Entry)
    ).

%
% if an Accesory become inaccessible we return the corresponding entry
% as unselectable. We also return the top-priority accessible accessory as
% selectable, if any,  along with the rest as non-selectable
%
selectable_audio_entry(Accessory, 0, Entry) :-
    (ground(Accessory),
     selectable_audio_entry_list_elem(Accessory, 0, Entry)
    )
    ;
    (audio_device_type(SinkOrSource, Accessory),
     top_priority_accessory(Accessory, SinkOrSource, TopPriorityAccessory),
     audio_accessory(OtherAccessory),
     audio_device_type(SinkOrSource, OtherAccessory),
     not(OtherAccessory = Accessory),
     (OtherAccessory = TopPriorityAccessory *->
          selectable_audio_entry_list_elem(OtherAccessory, 1, Entry)
      ;
          (accessory_exclude(TopPriorityAccessory, OtherAccessory) *->
	       selectable_audio(OtherAccessory),
	       selectable_audio_entry_list_elem(OtherAccessory, 0, Entry)
	   ;
	       accessible_audio(OtherAccessory),
	       selectable_audio_entry_list_elem(OtherAccessory, 1, Entry)
	  )
     )
    ).

update_selectable_audio_entry(Accessory, ReqDriverState, ReqConnectState,
			      List) :-
    audio_accessory(Accessory) *->
        new_audio_driver_state(Accessory, ReqDriverState, NewDriverState),
        new_audio_connect_state(Accessory, ReqConnectState, NewConnectState),
        Accessible is NewDriverState /\ NewConnectState,
        findall(E, selectable_audio_entry(Accessory, Accessible, E), List)
    ;
        List = [].


/*
 * update_accessory_mode
 */
update_accessory_mode(Accessory, Mode, List) :-
    affected_accessories(Accessory, AffectedList),
    accessory_mode_entries(AffectedList, Mode, List).


accessory_mode_entries(Accessories, Mode, List) :-
    accessory_mode_entries_(Accessories, Mode, [], List).

accessory_mode_entries_([], _, Acc, Acc).
accessory_mode_entries_([H|T], Mode, ListAcc, List) :-
    accessory_mode(H, Mode, HeadMode),
    accessory_mode_entries_(T, Mode, [HeadMode|ListAcc], List).

accessory_mode(Accessory, Type, Entry) :-
    accessory_mode_for_type(Accessory, Type, Mode) *->
        Entry = [audio_output_configuration, [device, Accessory], [mode, Mode]]
    ;
        Entry = [audio_output_configuration, [device, Accessory], [mode, none]].


affected_accessories(Accessory, List) :-
    findall(N, known_accessory_name(N), KnownAccessories),
    affected_accessories_(Accessory, KnownAccessories, [], List).

affected_accessories_(_, [], Acc, Acc).
affected_accessories_(Accessory, [H|T], ListAcc, List) :-
    is_affected_accessory(Accessory, H),
    affected_accessories_(Accessory, T, [H|ListAcc], List), !.
affected_accessories_(Accessory, [H|T], ListAcc, List) :-
    not(is_affected_accessory(Accessory, H)),
    affected_accessories_(Accessory, T, ListAcc, List), !.

%
% Accessory B is affected by changes to accessory A, if and only if
%   1) B is A
%   2) B is .*andA, or
%   3) B is Aand*.
%   4) B is Aforcall
%   5) B is Aforalien

is_affected_accessory(Accessory, Accessory).
is_affected_accessory(Accessory, TwinAccessory) :-
    sub_atom(TwinAccessory, 0, Len, _, Accessory),
    sub_atom(TwinAccessory, Len, 3, _, and).
is_affected_accessory(Accessory, TwinAccessory) :-
    sub_atom(TwinAccessory, Offs, _, _, Accessory),
    Offs > 3,
    AndOffs is Offs - 3,
    sub_atom(TwinAccessory, AndOffs, 3, _, and).
is_affected_accessory(Accessory, CallAccessory) :-
    atom_length(Accessory, Len),
    sub_atom(CallAccessory, 0, Len, 7, Accessory),
    sub_atom(CallAccessory, Len, 7, 0, forcall).
is_affected_accessory(Accessory, CallAccessory) :-
    atom_length(Accessory, Len),
    sub_atom(CallAccessory, 0, Len, 8, Accessory),
    sub_atom(CallAccessory, Len, 8, 0, foralien).


/*
 * FactStore interface
 */
video_connected_state(D, C) :-
    fact_exists('com.nokia.policy.video_device_accessible',
		[name, connected],
		[D, C]).

accessible_video(D) :-
    fact_exists('com.nokia.policy.video_device_accessible',
		[name, connected],
		[D, 1]).

selectable_video(D) :-
    fact_exists('com.nokia.policy.video_device_selectable',
		[name, selectable],
		[D, 1]).

audio_driver_state(D, S) :-
    fact_exists('com.nokia.policy.audio_device_accessible',
		[name, driver],
		[D, S]).

audio_connected_state(D, C) :-
    fact_exists('com.nokia.policy.audio_device_accessible',
		[name, connected],
		[D, C]).


accessible_audio(X) :-
    fact_exists('com.nokia.policy.audio_device_accessible',
		[name, driver, connected],
		[X, 1, 1]).


audio_device_selectable(D, S) :-
    fact_exists('com.nokia.policy.audio_device_selectable',
                [name, selectable],
                [D, S]).

selectable_audio(D) :-
    fact_exists('com.nokia.policy.audio_device_selectable',
                [name, selectable],
                [D, 1]).

audio_device_preferred(D, V) :-
    fact_exists('com.nokia.policy.audio_device_preferred',
                [name, preferred],
                [D, V]).

preferred_audio(D) :-
    audio_device_preferred(D, 1).

accessory_mode_for_type(D, T, M) :-
    fact_exists('com.nokia.policy.audio_mode',
		[device, T], [D, M]), !.

accessory_mode_for_type(_, _, unknown) :- !.

known_accessory_name(N) :-
    fact_exists('com.nokia.policy.audio_mode', [device], [N]).

