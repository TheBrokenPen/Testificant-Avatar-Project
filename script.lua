require("GSAnimBlend")
--hide vanilla model
--vanilla_model.PLAYER:setVisible(true)
--vanilla_model.head:setVisible(true)
--vanilla_model.body:setVisible(true)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)
--re-enable the helmet item
vanilla_model.HELMET_ITEM:setVisible(false)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(true)

--hide vanilla elytra model
vanilla_model.ELYTRA:setVisible(true)

--entity init event, used for when the avatar entity is loaded for the first time
function events.entity_init()
   --nothing goes here. whar u seeking for? :P
end


--tick event, called 20 times per second
function events.tick()
  local crouching = player:getPose() == "CROUCHING"
  -- This detects if you are crouching and stores it into crouch.
  -- So: crouch == true when crouching, and crouch == false when you're not crouching
  animations.model.walking:setPlaying(crouching)
end

--render event, called every time your avatar is rendered
--it have two arguments, "delta" and "context"
--"delta" is the percentage between the last and the next tick (as a decimal value, 0.0 to 1.0)
--"context" is a string that tells from where this render event was called (the paperdoll, gui, player render, first person)
function events.render(delta, context)
  --code goes here
end
