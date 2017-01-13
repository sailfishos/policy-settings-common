/*
 *
 */

%
% *** bta2dp ***
%
% accessories that can coexists:
%   - bthsp
%   - tvout (audio goes to bta2dp, but video goes to tvout)
%   - headmike
%
% accessories that are mutualy exclusive:
%
accessory_exclude( bta2dp,          headsetforcall       ).
accessory_exclude( bta2dp,          headphoneforcall     ).
accessory_exclude( bta2dp,          ihfforcall           ).

%
% *** bthsp ***
%
% accessories that can coexists:
%   - bta2dp
%   - tvout (audio goes to bthsp while video goes to tvout)
%
% accessories that are mutualy exclusive:
%
accessory_exclude( bthsp,           headsetforcall      ).
accessory_exclude( bthsp,           headphoneforcall    ).
accessory_exclude( bthsp,           ihfforcall          ).
accessory_exclude( bthsp,           headmike            ).

%
% *** headset ***
%
% accessories that can coexists:
%   - none
%
% accessories that are mutualy exclusive:
%
accessory_exclude( headset, bthsp     ).
accessory_exclude( headset, headphone ).
accessory_exclude( headset, tvout     ).
accessory_exclude( headset, headmike  ).

%
% *** headphone ***
%
% accessories that can coexists:
%   - none
%
% accessories that are mutualy exclusive:
%
accessory_exclude( headphone, bthsp    ).
accessory_exclude( headphone, headset  ).
accessory_exclude( headphone, tvout    ).
accessory_exclude( headphone, headmike ).

%
% *** tvout ***
%
% accessories that can coexists:
%   - bta2dp
%   - bthsp
%
% accessories that can coexists:
%   
accessory_exclude( tvout, headset   ).
accessory_exclude( tvout, headphone ).
accessory_exclude( tvout, headmike  ).

%
% *** headmike ***
%
% accessories that can coexists:
%   - bta2dp
%   - bthsp
%
% accessories that can coexists:
%   
accessory_exclude( headmike, headset   ).
accessory_exclude( headmike, headphone ).
accessory_exclude( headmike, tvout     ).

