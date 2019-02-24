local hyper = { "shift", "alt", "ctrl", "cmd" }
local remapModifier =  { "alt", "ctrl", "cmd" }

function bindKeypressToApplication(key, appName, layer)
  layer_ = layer or hyper

  hs.hotkey.bind(layer_, key, function() 
    hs.application.launchOrFocus(appName)
  end)
end

function remapKey(pressed, target)
  hs.hotkey.bind(remapModifier, pressed, function()
    hs.eventtap.keyStroke(nil, target)
  end)
end

-- applications --
bindKeypressToApplication("f", "Discord")
bindKeypressToApplication("c", "Google Chrome")
bindKeypressToApplication("d", "iTerm")
bindKeypressToApplication("r", "Spotify")
bindKeypressToApplication("o", "Signal")
bindKeypressToApplication("s", "Slack")
bindKeypressToApplication("v", "Postman")

-- key remappings --
remapKey("w", "Up")
remapKey("a", "Left")
remapKey("s", "Down")
remapKey("d", "Right")

remapKey("l", "Up")
remapKey("j", "Left")
remapKey("k", "Down")
remapKey(";", "Right")

-- auto-reload
hs.pathwatcher.new("~/.hammerspoon/init.lua", hs.reload):start()
hs.notify.new({ title="Hammerspoon", informativeText="Config reloaded." }):send()

