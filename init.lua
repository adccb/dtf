local hyper = { "shift", "alt", "ctrl", "cmd" }
local meh =  { "alt", "ctrl", "cmd" }

-- utility functions --
function bindKeypressToApplication(key, appName, layer)
  layer_ = layer or hyper

  hs.hotkey.bind(layer_, key, function() 
    hs.application.launchOrFocus(appName)
  end)
end

function remapKey(pressed, target, mods)
  mods_ = mods or nil

  hs.hotkey.bind(meh, pressed, function()
    hs.eventtap.keyStroke(mods_, target)
  end)
end

-- applications --
bindKeypressToApplication("c", "Google Chrome")
bindKeypressToApplication("d", "iTerm")
bindKeypressToApplication("r", "Spotify")
bindKeypressToApplication("s", "Slack")
bindKeypressToApplication("b", "Bear")
bindKeypressToApplication("x", "Drafts")
bindKeypressToApplication("e", "Discord")

-- key remappings --
remapKey("w", "Up")
remapKey("a", "Left")
remapKey("s", "Down")
remapKey("d", "Right")
remapKey("r", "pageup")
remapKey("f", "pagedown")

-- auto-reload
hs.pathwatcher.new("~/.hammerspoon/init.lua", hs.reload):start()
hs.notify.new({ title="Hammerspoon", informativeText="Config reloaded." }):send()

