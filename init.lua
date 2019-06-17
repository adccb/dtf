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
  hs.application.find("Google Chrome"):mainWindow():moveToUnit'[50,50,100,100]'
  hs.application.find("Slack"):mainWindow():moveToUnit'[0,0,50,50]'
  hs.application.find("Messages"):mainWindow():moveToUnit'[50,25,75,50]'
  hs.application.find("Spotify"):mainWindow():moveToUnit'[0,100,50,50]'
end

-- applications --
bindKeypressToApplication("c", "Google Chrome")
bindKeypressToApplication("d", "iTerm")
bindKeypressToApplication("r", "Spotify")
bindKeypressToApplication("s", "Slack")
bindKeypressToApplication("m", "Messages")

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

