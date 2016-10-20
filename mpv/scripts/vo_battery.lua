-- If the laptop is on battery, the VO set in the config will be choosen,
-- else the one defined with „hqvo“ is used.
local hqvo = "opengl:scale=spline36:cscale=spline36:dscale=mitchell:dither-depth=auto:correct-downscaling:sigmoid-upscaling:deband:es=no:icc-profile-auto:blend-subtitles=yes"
local utils = require 'mp.utils'
if mp.get_property_bool("option-info/vo/set-from-commandline") == true then
    return
end
t = {}
t.args = {"/usr/bin/pmset", "-g", "ac"}
res = utils.subprocess(t)
if res.stdout ~= "No adapter attached.\n" then
    mp.set_property("options/vo", hqvo)
end