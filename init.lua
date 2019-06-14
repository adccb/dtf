spaces = require("hs._asm.undocumented.spaces") 

local hyper = { "shift", "alt", "ctrl", "cmd" }
local remapModifier =  { "alt", "ctrl", "cmd" }
local topLeft = function() return '[0,0,50,50]' end
local topRight = function() return '[50,0,100,50]' end
local bottomLeft = function() return '[0,50,50,100]' end
local bottomRight = function() return '[50,50,100,100]' end

-- utility functions --
function bindKeypressToApplication(key, appName, layer)
  layer_ = layer or hyper

  hs.hotkey.bind(layer_, key, function() 
    hs.application.launchOrFocus(appName)
  end)
end

function remapKey(pressed, target, mods)
  mods_ = mods or nil

  hs.hotkey.bind(remapModifier, pressed, function()
    hs.eventtap.keyStroke(mods_, target)
  end)
end

function setupWorkLayout()
  hs.layout.apply({
    { "Google Chrome", nil, nil, bottomRight, nil, nil },
    { "Slack", nil, nil, topLeft, nil, nil },
    { "Firefox", nil, nil, bottomLeft, nil, nil },
    { "Spotify", nil, nil, bottomLeft, nil, nil },
  })
end

-- applications --
bindKeypressToApplication("f", "Firefox")
bindKeypressToApplication("c", "Google Chrome")
bindKeypressToApplication("d", "iTerm")
bindKeypressToApplication("r", "Spotify")
bindKeypressToApplication("o", "Signal")
bindKeypressToApplication("s", "Slack")
bindKeypressToApplication("v", "Hyper")

-- layout details --
hs.hotkey.bind(hyper, "k", setupWorkLayout)

-- key remappings --
remapKey("w", "Up")
remapKey("a", "Left")
remapKey("s", "Down")
remapKey("d", "Right")
remapKey("r", "pageup")
remapKey("f", "pagedown")

remapKey("l", "Up")
remapKey("j", "Left")
remapKey("k", "Down")
remapKey(";", "Right")

-- auto-reload
hs.pathwatcher.new("~/.hammerspoon/init.lua", hs.reload):start()
hs.notify.new({ title="Hammerspoon", informativeText="Config reloaded." }):send()

