local mainPage = action_wheel:newPage()
local emotePage = action_wheel:newPage()
local playerpage = action_wheel:newPage()
local musnum = 0

function events.entity_init()
    action_wheel:setPage(mainPage)
end

--Music Player--
local toMusicPlayer = mainPage:newAction()
toMusicPlayer:item("music_disc_otherside")
toMusicPlayer:title("Music player")
toMusicPlayer:onLeftClick(function()
    action_wheel:setPage(playerpage)
end)

local playerToMain = playerpage:newAction()
playerToMain:item("design_decor:arrow_up_sign")
playerToMain:title("Back to main page")
playerToMain:onLeftClick(function()
action_wheel:setPage(mainPage)
end)

local randomplay = playerpage:newAction()
randomplay:item("design_decor:glitch_warning_sign")
randomplay:title("Random Music")
randomplay:onLeftClick(function()
    --musnum = 16
    musnum = math.random(1,4)*100 + math.random(1,10)
    pings.msplay()
end)

function pings.msplay()
    if not player:isLoaded() then return end
    --Overworld--
    if musnum == 101 then sounds:playSound("music.creative",player:getPos()) log("Playing creative music")
    elseif musnum == 102 then sounds:playSound("music.game",player:getPos()) log("Playing game music")
    elseif musnum == 103 then sounds:playSound("music.menu",player:getPos()) log("Playing menu music")
    elseif musnum == 104 then sounds:playSound("music.overworld.swamp",player:getPos()) log("Playing Swamp Music")
    elseif musnum == 105 then sounds:playSound("music.overworld.grove",player:getPos()) log("Playing Grove Music")
    elseif musnum == 106 then sounds:playSound("music.overworld.lush_caves",player:getPos()) log("Playing Lush Caves Music")
    elseif musnum == 107 then sounds:playSound("music.overworld.cherry_grove",player:getPos()) log("Playing Cherry Grove Music")
    elseif musnum == 108 then sounds:playSound("music.overworld.badlands",player:getPos()) log("Playing Badlands Music")
    --Nether--
    elseif musnum == 201 then sounds:playSound("music.nether.basalt_deltas",player:getPos()) log("Playing 1.16 Update Music")
    --The End--
    elseif musnum == 301 then sounds:playSound("music.credits",player:getPos()) log("Playing [Alpha]")
    --Music Discs--
    elseif musnum == 401 then sounds:playSound("morediscs:music_disc_sky_sound",player:getPos()) log("Playing [Sky]")
    elseif musnum == 402 then sounds:playSound("morediscs:music_disc_antiremake_sound",player:getPos()) log("Playing [Anti Remake]")
    elseif musnum == 403 then sounds:playSound("music_disc.cat",player:getPos()) log("Playing [Cat]")
    elseif musnum == 404 then sounds:playSound("music_disc.otherside",player:getPos()) log("Playing [OtherSide]")
    elseif musnum == 405 then sounds:playSound("music_disc.wait",player:getPos()) log("Playing [Wait]")
    elseif musnum == 406 then sounds:playSound("music_disc.strad",player:getPos()) log("Playing [Strad]")
    elseif musnum == 407 then sounds:playSound("music_disc.mall",player:getPos()) log("Playing [Mall]")
    elseif musnum == 408 then sounds:playSound("music_disc.11",player:getPos()) log("Playing [11]")
    elseif musnum == 409 then sounds:playSound("music_disc.wait",player:getPos()) log("Playing [Wait]")
    else log("Error: Invalid Music Number")
    end
end

--Log Printer--
local annoy = mainPage:newAction()
annoy:item("create:clipboard")
annoy:title("Show log")
annoy:onLeftClick(function()
log("This button just puts this in your chat")
end)

--Emote Page--
local toEmote = mainPage:newAction()
toEmote:item("design_decor:silly_sign")
toEmote:title("Emotes")
toEmote:onLeftClick(function()
    action_wheel:setPage(emotePage)
end)

--Emote Page: Visibility--
local vanish = mainPage:newAction()
vanish:item("lime_dye")
vanish:toggleItem("gray_dye")
vanish:title("You're visible")
vanish:toggleTitle("You're invisible")
function pings.poof(x)
if not player:isLoaded() then return end
models:setVisible(not x)
vanilla_model.ALL:setVisible(not x)
nameplate.ENTITY:setVisible(not x)
particles:newParticle("explosion",player:getPos())
end
vanish:onToggle(pings.poof)

--Emote Page: Float--
local hover = emotePage:newAction()
hover:item("shulker_shell")
hover:color(1,0,1)
function pings.up(x)
vanilla_model.ALL:setPos(0,x and 5 or 0,0)
end
hover:onToggle(pings.up)

--Emote Page: Death--
local death = emotePage:newAction()
death:item("skeleton_skull")
death:color(0,0,0)
death:title("You're dead")
function pings.dead(x)
vanilla_model.ALL:setRot(x and 90 or 0,0,0)
vanilla_model.ALL:setPos(0,x and -20 or 0,0)
if x then
    log("yes it looks bad dont @ me")
else
    log("yes you're stuck like that now")
end
end
death:onToggle(pings.dead)

--Emote Page: Back to main--
local toMain = emotePage:newAction()
toMain:item("design_decor:arrow_up_sign")
toMain:title("Back to main page")
toMain:onLeftClick(function()
action_wheel:setPage(mainPage)
end)