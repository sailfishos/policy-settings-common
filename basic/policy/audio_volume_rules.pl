%           ActiveGroup  GroupToLimit Level
%           ----------------------------------
volume_limit( navigator ,  alwayson   , 100  ).
volume_limit( navigator ,  nonsilent  , 100  ).
volume_limit( navigator ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( navigator ,  navigator  , 100  ).
volume_limit( navigator ,  call       , 100  ).
volume_limit( navigator ,  aliencall  , 100  ).
volume_limit( navigator ,  videoeditor, 100  ).
volume_limit( navigator ,  camera     , 100  ).
volume_limit( navigator ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( navigator ,  alarm      , 100  ).
volume_limit( navigator ,  game       , 0    ).
volume_limit( navigator ,  player     , 0    ).
volume_limit( navigator ,  flash      , 0    ).
volume_limit( navigator ,  event      , 100  ).
volume_limit( navigator ,  systemsound, 100  ).
volume_limit( navigator ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( navigator ,  inputsound , 0    ).
volume_limit( navigator ,  othermedia , 0    ).
volume_limit( navigator ,  background , 50   ).
volume_limit( navigator ,  alien      , 0    ).
volume_limit( navigator ,  btnotify   , 0    ).
volume_limit( navigator ,  idle       , 100  ).

volume_limit( call      ,  alwayson   , 100  ).
volume_limit( call      ,  nonsilent  , 100  ).
volume_limit( call      ,  cstone     , 100  ).
volume_limit( call      ,  navigator  , 100  ).
volume_limit( call      ,  call       , 100  ).
volume_limit( call      ,  aliencall  , 0    ).
volume_limit( call      ,  videoeditor, 0    ).
volume_limit( call      ,  camera     , 100  ).
volume_limit( call      ,  ringtone   , 0    ).
volume_limit( call      ,  alarm      , 0    ).
volume_limit( call      ,  game       , 0    ).
volume_limit( call      ,  player     , 0    ).
volume_limit( call      ,  flash      , 0    ).
volume_limit( call      ,  event      , 0    ).
volume_limit( call      ,  systemsound, 100  ).
volume_limit( call      ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( call      ,  inputsound , 0    ).
volume_limit( call      ,  othermedia , 0    ).
volume_limit( call      ,  background , 10   ).
volume_limit( call      ,  alien      , 0    ).
volume_limit( call      ,  btnotify   , 0    ).
volume_limit( call      ,  idle       , 100  ).

volume_limit( videoeditor,  alwayson   , 100  ).
volume_limit( videoeditor,  nonsilent  , 100  ).
volume_limit( videoeditor,  cstone     , 100  ).
volume_limit( videoeditor,  navigator  , 100  ).
volume_limit( videoeditor,  call       , 100  ).
volume_limit( videoeditor,  aliencall  , 100  ).
volume_limit( videoeditor,  videoeditor, 100  ).
volume_limit( videoeditor,  camera     , 100  ).
volume_limit( videoeditor,  ringtone   , 0    ).
volume_limit( videoeditor,  alarm      , 0    ).
volume_limit( videoeditor,  game       , 0    ).
volume_limit( videoeditor,  player     , 0    ).
volume_limit( videoeditor,  flash      , 0    ).
volume_limit( videoeditor,  event      , 0    ).
volume_limit( videoeditor,  systemsound, 100  ).
volume_limit( videoeditor,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( videoeditor,  inputsound , 0    ).
volume_limit( videoeditor,  othermedia , 0    ).
volume_limit( videoeditor,  background , 10   ).
volume_limit( videoeditor,  alien      , 0    ).
volume_limit( videoeditor,  btnotify   , 0    ).
volume_limit( videoeditor,  idle       , 100  ).

volume_limit( camera    ,  alwayson   , 0    ).
volume_limit( camera    ,  nonsilent  , 0    ).
volume_limit( camera    ,  cstone     , 0    ).
volume_limit( camera    ,  navigator  , 100  ).
volume_limit( camera    ,  call       , 100  ).
volume_limit( camera    ,  aliencall  , 100  ).
volume_limit( camera    ,  videoeditor, 100  ).
volume_limit( camera    ,  camera     , 100  ).
volume_limit( camera    ,  ringtone   , 0    ).
volume_limit( camera    ,  alarm      , 0    ).
volume_limit( camera    ,  game       , 0    ).
volume_limit( camera    ,  player     , 0    ).
volume_limit( camera    ,  flash      , 0    ).
volume_limit( camera    ,  event      , 0    ).
volume_limit( camera    ,  systemsound, 0    ).
volume_limit( camera    ,  feedbacksound, Value) :- feedbacksound_limit(Value, 0).
volume_limit( camera    ,  inputsound , 0    ).
volume_limit( camera    ,  othermedia , 0    ).
volume_limit( camera    ,  background , 0    ).
volume_limit( camera    ,  alien      , 0    ).
volume_limit( camera    ,  btnotify   , 0    ).
volume_limit( camera    ,  idle       , 0    ).

volume_limit( ringtone  ,  alwayson   , 100  ).
volume_limit( ringtone  ,  nonsilent  , 100  ).
volume_limit( ringtone  ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( ringtone  ,  navigator  , 100  ).
volume_limit( ringtone  ,  call       , 100  ).
volume_limit( ringtone  ,  aliencall  , 100  ).
volume_limit( ringtone  ,  videoeditor, 100  ).
volume_limit( ringtone  ,  camera     , 100  ).
volume_limit( ringtone  ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( ringtone  ,  alarm      , 0    ).
volume_limit( ringtone  ,  game       , 0    ).
volume_limit( ringtone  ,  player     , 0    ).
volume_limit( ringtone  ,  flash      , 0    ).
volume_limit( ringtone  ,  event      , 0    ).
volume_limit( ringtone  ,  systemsound, 0    ).
volume_limit( ringtone  ,  feedbacksound, Value) :- feedbacksound_limit(Value, 0).
volume_limit( ringtone  ,  inputsound , 0    ).
volume_limit( ringtone  ,  othermedia , 0    ).
volume_limit( ringtone  ,  background , 0    ).
volume_limit( ringtone  ,  alien      , 0    ).
volume_limit( ringtone  ,  btnotify   , 0    ).
volume_limit( ringtone  ,  idle       , 0    ).

volume_limit( alarm     ,  alwayson   , 100  ).
volume_limit( alarm     ,  nonsilent  , 100  ).
volume_limit( alarm     ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( alarm     ,  navigator  , 100  ).
volume_limit( alarm     ,  call       , 0    ).
volume_limit( alarm     ,  aliencall  , 0    ).
volume_limit( alarm     ,  videoeditor, 0    ).
volume_limit( alarm     ,  camera     , 100  ).
volume_limit( alarm     ,  ringtone   , 0    ).
volume_limit( alarm     ,  alarm      , 100  ).
volume_limit( alarm     ,  game       , 0    ).
volume_limit( alarm     ,  player     , 0    ).
volume_limit( alarm     ,  flash      , 0    ).
volume_limit( alarm     ,  event      , 0    ).
volume_limit( alarm     ,  systemsound, 0    ).
volume_limit( alarm     ,  feedbacksound, Value) :- feedbacksound_limit(Value, 0).
volume_limit( alarm     ,  inputsound , 0    ).
volume_limit( alarm     ,  othermedia , 0    ).
volume_limit( alarm     ,  background , 0    ).
volume_limit( alarm     ,  alien      , 0    ).
volume_limit( alarm     ,  btnotify   , 0    ).
volume_limit( alarm     ,  idle       , 0    ).

volume_limit( game      ,  alwayson   , 100  ).
volume_limit( game      ,  nonsilent  , 100  ).
volume_limit( game      ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( game      ,  navigator  , 100  ).
volume_limit( game      ,  call       , 100  ).
volume_limit( game      ,  aliencall  , 100  ).
volume_limit( game      ,  videoeditor, 100  ).
volume_limit( game      ,  camera     , 100  ).
volume_limit( game      ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( game      ,  alarm      , 100  ).
volume_limit( game      ,  game       , 100  ).
volume_limit( game      ,  player     , 100  ).
volume_limit( game      ,  flash      , 0    ).
volume_limit( game      ,  event      , 100  ).
volume_limit( game      ,  systemsound, 100  ).
volume_limit( game      ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( game      ,  inputsound , 0    ).
volume_limit( game      ,  othermedia , 0    ).
volume_limit( game      ,  background , 100  ).
volume_limit( game      ,  alien      , 100  ).
volume_limit( game      ,  btnotify   , 100  ).
volume_limit( game      ,  idle       , 100  ).

volume_limit( player    ,  alwayson   , 100  ).
volume_limit( player    ,  nonsilent  , 100  ).
volume_limit( player    ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( player    ,  navigator  , 100  ).
volume_limit( player    ,  call       , 100  ).
volume_limit( player    ,  aliencall  , 100  ).
volume_limit( player    ,  videoeditor, 100  ).
volume_limit( player    ,  camera     , 100  ).
volume_limit( player    ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( player    ,  alarm      , 100  ).
volume_limit( player    ,  game       , 100  ).
volume_limit( player    ,  player     , 100  ).
volume_limit( player    ,  flash      , 0    ).
volume_limit( player    ,  event      , 100  ).
volume_limit( player    ,  systemsound, 100  ).
volume_limit( player    ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( player    ,  inputsound , 0    ).
volume_limit( player    ,  othermedia , 0    ).
volume_limit( player    ,  background , 100  ).
volume_limit( player    ,  alien      , 100  ).
volume_limit( player    ,  btnotify   , 100  ).
volume_limit( player    ,  idle       , 100  ).

volume_limit( flash     ,  alwayson   , 100  ).
volume_limit( flash     ,  nonsilent  , 100  ).
volume_limit( flash     ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( flash     ,  navigator  , 100  ).
volume_limit( flash     ,  call       , 100  ).
volume_limit( flash     ,  aliencall  , 100  ).
volume_limit( flash     ,  videoeditor, 100  ).
volume_limit( flash     ,  camera     , 100  ).
volume_limit( flash     ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( flash     ,  alarm      , 100  ).
volume_limit( flash     ,  game       , 100  ).
volume_limit( flash     ,  player     , 100  ).
volume_limit( flash     ,  flash      , 100  ).
volume_limit( flash     ,  event      , 100  ).
volume_limit( flash     ,  systemsound, 100  ).
volume_limit( flash     ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( flash     ,  inputsound , 0    ).
volume_limit( flash     ,  othermedia , 0    ).
volume_limit( flash     ,  background , 100  ).
volume_limit( flash     ,  alien      , 100  ).
volume_limit( flash     ,  btnotify   , 100  ).
volume_limit( flash     ,  idle       , 100  ).

volume_limit( othermedia,  alwayson   , 100  ).
volume_limit( othermedia,  nonsilent  , 100  ).
volume_limit( othermedia,  cstone     , Value) :- cstone_limit(Value).
volume_limit( othermedia,  navigator  , 100  ).
volume_limit( othermedia,  call       , 100  ).
volume_limit( othermedia,  aliencall  , 100  ).
volume_limit( othermedia,  videoeditor, 100  ).
volume_limit( othermedia,  camera     , 100  ).
volume_limit( othermedia,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( othermedia,  alarm      , 100  ).
volume_limit( othermedia,  game       , 100  ).
volume_limit( othermedia,  player     , 100  ).
volume_limit( othermedia,  flash      , 100  ).
volume_limit( othermedia,  event      , 100  ).
volume_limit( othermedia,  systemsound, 100  ).
volume_limit( othermedia,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( othermedia,  inputsound , 100  ).
volume_limit( othermedia,  othermedia , 100  ).
volume_limit( othermedia,  background , 100  ).
volume_limit( othermedia,  alien      , 100  ).
volume_limit( othermedia,  btnotify   , 100  ).
volume_limit( othermedia,  idle       , 100  ).

volume_limit( event     ,  alwayson   , 100  ).
volume_limit( event     ,  nonsilent  , 100  ).
volume_limit( event     ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( event     ,  navigator  , 100  ).
volume_limit( event     ,  call       , 0    ).
volume_limit( event     ,  aliencall  , 100  ).
volume_limit( event     ,  videoeditor, 0    ).
volume_limit( event     ,  camera     , 100  ).
volume_limit( event     ,  ringtone   , 0    ).
volume_limit( event     ,  alarm      , 0    ).
volume_limit( event     ,  game       , 0    ).
volume_limit( event     ,  player     , 0    ).
volume_limit( event     ,  flash      , 0    ).
volume_limit( event     ,  event      , 100  ).
volume_limit( event     ,  systemsound, 100  ).
volume_limit( event     ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( event     ,  inputsound , 0    ).
volume_limit( event     ,  othermedia , 0    ).
volume_limit( event     ,  background , 10   ).
volume_limit( event     ,  alien      , 0    ).
volume_limit( event     ,  btnotify   , 0    ).
volume_limit( event     ,  idle       , 100  ).

volume_limit( background,  alwayson   , 100  ).
volume_limit( background,  nonsilent  , 100  ).
volume_limit( background,  cstone     , Value) :- cstone_limit(Value).
volume_limit( background,  navigator  , 100  ).
volume_limit( background,  call       , 100  ).
volume_limit( background,  aliencall  , 100  ).
volume_limit( background,  videoeditor, 100  ).
volume_limit( background,  camera     , 100  ).
volume_limit( background,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( background,  alarm      , 100  ).
volume_limit( background,  game       , 100  ).
volume_limit( background,  player     , 100  ).
volume_limit( background,  flash      , 100  ).
volume_limit( background,  event      , 100  ).
volume_limit( background,  systemsound, 100  ).
volume_limit( background,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( background,  inputsound , 100  ).
volume_limit( background,  othermedia , 0  ).
volume_limit( background,  background , 100  ).
volume_limit( background,  alien      , 100  ).
volume_limit( background,  btnotify   , 100  ).
volume_limit( background,  idle       , 100  ).

volume_limit( alien    ,  alwayson   , 100  ).
volume_limit( alien    ,  nonsilent  , 100  ).
volume_limit( alien    ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( alien    ,  navigator  , 100  ).
volume_limit( alien    ,  call       , 100  ).
volume_limit( alien    ,  aliencall  , 100  ).
volume_limit( alien    ,  videoeditor, 100  ).
volume_limit( alien    ,  camera     , 100  ).
volume_limit( alien    ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( alien    ,  alarm      , 100  ).
volume_limit( alien    ,  game       , 100  ).
volume_limit( alien    ,  player     , 100  ).
volume_limit( alien    ,  flash      , 0    ).
volume_limit( alien    ,  event      , 100  ).
volume_limit( alien    ,  systemsound, 100  ).
volume_limit( alien    ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( alien    ,  inputsound , 0    ).
volume_limit( alien    ,  othermedia , 0    ).
volume_limit( alien    ,  background , 100  ).
volume_limit( alien    ,  alien      , 100  ).
volume_limit( alien    ,  btnotify   , 100  ).
volume_limit( alien    ,  idle       , 100  ).

volume_limit( aliencall,  alwayson   , 100  ).
volume_limit( aliencall,  nonsilent  , 100  ).
volume_limit( aliencall,  cstone     , Value) :- cstone_limit(Value).
volume_limit( aliencall,  navigator  , 100  ).
volume_limit( aliencall,  call       , 100  ).
volume_limit( aliencall,  aliencall  , 100  ).
volume_limit( aliencall,  videoeditor, 100  ).
volume_limit( aliencall,  camera     , 100  ).
volume_limit( aliencall,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( aliencall,  alarm      , 100  ).
volume_limit( aliencall,  game       , 100  ).
volume_limit( aliencall,  player     , 100  ).
volume_limit( aliencall,  flash      , 0    ).
volume_limit( aliencall,  event      , 100  ).
volume_limit( aliencall,  systemsound, 100  ).
volume_limit( aliencall,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( aliencall,  inputsound , 0    ).
volume_limit( aliencall,  othermedia , 0    ).
volume_limit( aliencall,  background , 100  ).
volume_limit( aliencall,  alien      , 100  ).
volume_limit( aliencall,  btnotify   , 100  ).
volume_limit( aliencall,  idle       , 100  ).

volume_limit( btnotify ,  alwayson   , 100  ).
volume_limit( btnotify ,  nonsilent  , 100  ).
volume_limit( btnotify ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( btnotify ,  navigator  , 100  ).
volume_limit( btnotify ,  call       , 100  ).
volume_limit( btnotify ,  aliencall  , 100  ).
volume_limit( btnotify ,  videoeditor, 100  ).
volume_limit( btnotify ,  camera     , 100  ).
volume_limit( btnotify ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( btnotify ,  alarm      , 100  ).
volume_limit( btnotify ,  game       , 100  ).
volume_limit( btnotify ,  player     , 100  ).
volume_limit( btnotify ,  flash      , 0    ).
volume_limit( btnotify ,  event      , 100  ).
volume_limit( btnotify ,  systemsound, 100  ).
volume_limit( btnotify ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( btnotify ,  inputsound , 0    ).
volume_limit( btnotify ,  othermedia , 0    ).
volume_limit( btnotify ,  background , 100  ).
volume_limit( btnotify ,  alien      , 100  ).
volume_limit( btnotify ,  btnotify   , 100  ).
volume_limit( btnotify ,  idle       , 100  ).

volume_limit( idle      ,  alwayson   , 100  ).
volume_limit( idle      ,  nonsilent  , 100  ).
volume_limit( idle      ,  cstone     , Value) :- cstone_limit(Value).
volume_limit( idle      ,  navigator  , 100  ).
volume_limit( idle      ,  call       , 100  ).
volume_limit( idle      ,  aliencall  , 100  ).
volume_limit( idle      ,  videoeditor, 100  ).
volume_limit( idle      ,  camera     , 100  ).
volume_limit( idle      ,  ringtone   , Value) :- ringtone_limit(Value).
volume_limit( idle      ,  alarm      , 100  ).
volume_limit( idle      ,  game       , 100  ).
volume_limit( idle      ,  player     , 100  ).
volume_limit( idle      ,  flash      , 100  ).
volume_limit( idle      ,  event      , 100  ).
volume_limit( idle      ,  systemsound, 100  ).
volume_limit( idle      ,  feedbacksound, Value) :- feedbacksound_limit(Value, 100).
volume_limit( idle      ,  inputsound , 100  ).
volume_limit( idle      ,  othermedia , 100  ).
volume_limit( idle      ,  background , 100  ).
volume_limit( idle      ,  alien      , 100  ).
volume_limit( idle      ,  btnotify   , 100  ).
volume_limit( idle      ,  idle       , 100  ).

ringtone_limit(Value) :-
    % # Ringtone volume is 0 if in silent mode and not routed to wired accessory
    (is_silent_profile,
     audio_route:get_route(sink, Device),
     not(wired_audio_accessory(Device))) *-> Value=0,!;
    % # Protection against excessive sound pressure from headset during ringtone.
    % # Limit volume to 77(-6.81 dB) if ringtone has been set to high volume.
    (audio_route:get_route(sink, ihfandheadphone);
     audio_route:get_route(sink, ihfandheadset);
     audio_route:get_route(sink, headphone);
     audio_route:get_route(sink, headset)) *-> Value=77,!; 
    % # Default volume
    Value=100,!.

cstone_limit(Value) :-
    % cstone volume is 0 if feedback tones are disabled and call is not active
    (is_silent_feedback,
     not(context:call_state(active)),
     not(context:call_state(voip))) *-> Value=0;
    % Default volume
    Value=100.

feedbacksound_limit(Value, Default) :-
    (audio_route:get_route(sink, Device),
     bt_audio_accessory(Device)) *-> Value=0,!;
    Value=Default,!.
