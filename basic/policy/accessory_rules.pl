/*
 *
 */

%
% *** bta2dp ***
%
% accessories that are mutualy exclusive:
%
accessory_exclude( bta2dp,          headsetforcall       ).
accessory_exclude( bta2dp,          headphoneforcall     ).

%
% *** bthsp ***
%
% accessories that are mutualy exclusive:
%
accessory_exclude( bthsp,           headsetforcall      ).
accessory_exclude( bthsp,           headphoneforcall    ).
accessory_exclude( bthsp,           headmike            ).
accessory_exclude( bthsp,           bthfp               ).

accessory_exclude( bthfp,           headsetforcall      ).
accessory_exclude( bthfp,           headphoneforcall    ).
accessory_exclude( bthfp,           headmike            ).
accessory_exclude( bthfp,           bthsp               ).

%
% *** headset ***
%
% accessories that are mutualy exclusive:
%
accessory_exclude( headset, bthfp     ).
accessory_exclude( headset, bthsp     ).
accessory_exclude( headset, headphone ).
accessory_exclude( headset, tvout     ).
accessory_exclude( headset, headmike  ).

%
% *** headphone ***
%
% accessories that are mutualy exclusive:
%
accessory_exclude( headphone, bthfp    ).
accessory_exclude( headphone, bthsp    ).
accessory_exclude( headphone, headset  ).
accessory_exclude( headphone, tvout    ).
accessory_exclude( headphone, headmike ).

%
% *** tvout ***
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
%
accessory_exclude( headmike, headset   ).
accessory_exclude( headmike, headphone ).
accessory_exclude( headmike, tvout     ).

