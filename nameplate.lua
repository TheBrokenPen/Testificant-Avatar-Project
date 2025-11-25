-- ## Research Zone: showTypingStatus ##
-- --------------------------------------------

require("data")
local cooldown = 0
local MAX_COOLDOWN = 200
local NAMEPLATE = { bold = "true", text = 'Nameplate Initializing...', color = '#ffcc00ff'}

-- Initialize content
nameplate.ALL:setText(toJson(NAMEPLATE))
nameplate.CHAT:setText(toJson({data.NAMEPLATE_Main}))
nameplate.LIST:setText(toJson({data.NAMEPLATE_Prefix,data.NAMEPLATE_Main}))
nameplate.ENTITY:setText(toJson(data.NAMEPLATE))

-- Simple content defination
function pings.IsTyping()
    NAMEPLATE = {data.NAMEPLATE_Typing,data.NAMEPLATE_Main}
    --log("IsTyping",toJson(NAMEPLATE))
    nameplate.LIST:setText(toJson(NAMEPLATE))
end

function pings.EndsTyping()
    NAMEPLATE = {data.NAMEPLATE_Main}
    --log("EndsTyping",toJson(NAMEPLATE))
    nameplate.LIST:setText(toJson(NAMEPLATE))
end

-- Main function
function events.CHAR_TYPED()
    if (not host:isChatOpen()) then return end

    if (cooldown < MAX_COOLDOWN / 4) then
        pings.IsTyping()
        cooldown = MAX_COOLDOWN
    end
end

function events.TICK()
    if (cooldown == 0) then return end

    cooldown = cooldown - 1

    if (cooldown == 1) then
        pings.EndsTyping()
    end

    if (not host:isChatOpen()) then
        pings.EndsTyping()
        cooldown = 0
    end
end

