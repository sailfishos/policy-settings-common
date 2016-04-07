video_device(builtinandtvout).
video_device(builtin).
video_device(tvout).

audio_device_type(sink).
audio_device_type(source).

audio_device(incompatible).
audio_device(headphoneasfmradiolp).
audio_device(headsetasfmradiolp).
audio_device(headphoneasfmradio).
audio_device(headsetasfmradio).
audio_device(voicecall).
audio_device(tvoutandbta2dp).
audio_device(tvoutandbthsp).
audio_device(ihfandbthsp).
audio_device(ihfandheadset).
audio_device(ihfandheadphone).
audio_device(bta2dp).
audio_device(bta2dpforalien).
audio_device(bthspforcall).
audio_device(bthspforalien).
audio_device(bthsp).
audio_device(headsetforcall).
audio_device(headsetforalien).
audio_device(headset).
audio_device(headphoneforcall).
audio_device(headphoneforalien).
audio_device(headphone).
audio_device(headmike).
audio_device(ihfandtvout).
audio_device(tvout).
audio_device(earpieceandtvout).
audio_device(earpiece).
audio_device(earpieceforalien).
audio_device(microphone).
audio_device(backmicrophone).
audio_device(ihfforcall).
audio_device(ihfforalien).
audio_device(usbaudio).
audio_device(ihf).
audio_device(fmradioloopback).
audio_device(fmradio).
audio_device(null).


audio_device_type(sink  , incompatible).
audio_device_type(sink  , tvoutandbta2dp).
audio_device_type(sink  , tvoutandbthsp).
audio_device_type(sink  , ihfandbthsp).
audio_device_type(sink  , ihfandheadset).
audio_device_type(sink  , ihfandheadphone).
audio_device_type(sink  , bta2dp).
audio_device_type(sink  , bta2dpforalien).
audio_device_type(sink  , bthspforcall).
audio_device_type(sink  , bthspforalien).
audio_device_type(sink  , bthsp).
audio_device_type(sink  , headsetforcall).
audio_device_type(sink  , headsetforalien).
audio_device_type(sink  , headset).
audio_device_type(sink  , headphoneforcall).
audio_device_type(sink  , headphoneforalien).
audio_device_type(sink  , headphone).
audio_device_type(sink  , ihfandtvout).
audio_device_type(sink  , tvout).
audio_device_type(sink  , earpieceandtvout).
audio_device_type(sink  , earpieceforalien).
audio_device_type(sink  , earpiece).
audio_device_type(sink  , ihfforcall).
audio_device_type(sink  , ihfforalien).
audio_device_type(sink  , usbaudio).
audio_device_type(sink  , ihf).
audio_device_type(sink  , null).
audio_device_type(source, fmradioloopback).
audio_device_type(source, fmradio).
audio_device_type(source, voicecall).
audio_device_type(source, headphoneasfmradiolp).
audio_device_type(source, headsetasfmradiolp).
audio_device_type(source, headphoneasfmradio).
audio_device_type(source, headsetasfmradio).
audio_device_type(source, usbaudio).
audio_device_type(source, tvoutandbthsp).
audio_device_type(source, bthsp).
audio_device_type(source, bthspforcall).
audio_device_type(source, bthspforalien).
audio_device_type(source, headset).
audio_device_type(source, headsetforcall).
audio_device_type(source, headsetforalien).
audio_device_type(source, headmike).
audio_device_type(source, microphone).
audio_device_type(source, backmicrophone).

audio_device_privavy(private, incompatible).
audio_device_privacy(private, tvoutandbta2dp).
audio_device_privacy(private, tvoutandbthsp).
audio_device_privacy(private, ihfandbthsp).
audio_device_privacy(private, ihfandheadset).
audio_device_privacy(private, ihfandheadphone).
audio_device_privacy(private, bta2dp).
audio_device_privacy(private, bta2dpforalien).
audio_device_privacy(private, bthspforcall).
audio_device_privacy(private, bthspforalien).
audio_device_privacy(private, bthsp).
audio_device_privacy(private, headsetforcall).
audio_device_privacy(private, headsetforalien).
audio_device_privacy(private, headset).
audio_device_privacy(private, headphoneforcall).
audio_device_privacy(private, headphoneforalien).
audio_device_privacy(private, headphone).
audio_device_privacy(private, earpieceandtvout).
audio_device_privacy(private, earpieceforalien).
audio_device_privacy(private, earpiece).
audio_device_privacy(public , ihfandtvout).
audio_device_privacy(public , tvout).
audio_device_privacy(public , ihfforcall).
audio_device_privacy(public , ihfforalien).
audio_device_privacy(public , ihf).
audio_device_privacy(private, microphone).
audio_device_privacy(public , microphone).
audio_device_privacy(private, backmicrophone).
audio_device_privacy(public , backmicrophone).
audio_device_privacy(private, headmike).
audio_device_privacy(private, usbaudio).
audio_device_privacy(private, fmradioloopback).
audio_device_privacy(private, fmradio).
audio_device_privacy(private, headphoneasfmradiolp).
audio_device_privacy(private, headsetasfmradiolp).
audio_device_privacy(private, headphoneasfmradio).
audio_device_privacy(private, headsetasfmradio).
audio_device_privacy(private, voicecall).

accessory(incompatible).
accessory(bta2dp).
accessory(bta2dpforalien).
accessory(bthspforcall).
accessory(bthspforalien).
accessory(bthsp).
accessory(headsetforcall).
accessory(headsetforalien).
accessory(headset).
accessory(headphoneforcall).
accessory(headphoneforalien).
accessory(headphone).
accessory(tvout).
accessory(headmike).
accessory(usbaudio).

video_accessory(tvout).

audio_accessory(incompatible).
audio_accessory(bta2dp).
audio_accessory(bthsp).
audio_accessory(headset).
audio_accessory(headphone).
audio_accessory(tvout).
audio_accessory(headmike).
audio_accessory(usbaudio).
audio_accessory(fmradioloopback).
audio_accessory(fmradio).
audio_accessory(voicecall).

wired_audio_accessory(headset).
wired_audio_accessory(headphone).

bt_audio_accessory(bta2dp).
bt_audio_accessory(bta2dpforalien).
bt_audio_accessory(bthspforcall).
bt_audio_accessory(bthspforalien).
bt_audio_accessory(bthsp).

call_audio_device(ihf,          ihfforcall).
call_audio_device(headset,      headsetforcall).
call_audio_device(headphone,    headphoneforcall).
call_audio_device(bthsp,        bthspforcall).
call_audio_device(ihf,          ihfforalien).
call_audio_device(earpiece,     earpieceforalien).
call_audio_device(headset,      headsetforalien).
call_audio_device(headphone,    headphoneforalien).
call_audio_device(bthsp,        bthspforalien).
call_audio_device(bta2dp,       bta2dpforalien).


twin_video_device(builtinandtvout).

twin_video_device(tvout, builtinandtvout).

%
% NOTE: the tvoutandbta2dp, tvoutandbthsp, and earpieceandtvout is
%       not really an audio twin device, since audio goes to bta2dp, bthsp,
%       or earpiece while the video goes to tvout. It is needed since
%       'Jack function' in ALSA should be set to TVOUT in order to get
%       video connected internally to jack.
%
%       The uggly hack is that tvoutbta2dp, tvoutbthsp, and
%       earpieceandtvout are not among the twin_audio_devices/1, that is used
%       in audio_route_rules.pl to rule out the invalid device choices.
%       However, they are among the twin_audio_devices/3, that is used to set
%       the selectable accessories (i.e. when tvout is connected the
%       earpieceandtvout become also selectable).
% 

twin_audio_device(ihfandheadset).
twin_audio_device(ihfandheadphone).
twin_audio_device(ihfandbthsp).
twin_audio_device(ihfandtvout).

twin_audio_device(tvout     , bta2dp  , tvoutandbta2dp).   % not really a twin
twin_audio_device(tvout     , bthsp   , tvoutandbthsp).    % not really a twin
twin_audio_device(bta2dp    , tvout   , tvoutandbta2dp).
twin_audio_device(bthsp     , tvout   , tvoutandbthsp).
twin_audio_device(headset   , ihf     , ihfandheadset).
twin_audio_device(headphone , ihf     , ihfandheadphone).
twin_audio_device(bthsp     , ihf     , ihfandbthsp).
twin_audio_device(tvout     , ihf     , ihfandtvout).
twin_audio_device(tvout     , earpiece, earpieceandtvout). % not really a twin

slave_audio_device(fmradioloopback).
slave_audio_device(fmradio).

slave_audio_device(headphone        , fmradioloopback   , headphoneasfmradiolp).
slave_audio_device(fmradioloopback  , headphone         , headphoneasfmradiolp).
slave_audio_device(headset          , fmradioloopback   , headsetasfmradiolp).
slave_audio_device(fmradioloopback  , headset           , headsetasfmradiolp).

slave_audio_device(headphone        , fmradio           , headphoneasfmradio).
slave_audio_device(fmradio          , headphone         , headphoneasfmradio).
slave_audio_device(headset          , fmradio           , headsetasfmradio).
slave_audio_device(fmradio          , headset           , headsetasfmradio).
