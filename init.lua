local hyper = { "alt" }
local remapModifier = { "ctrl" }

function bindKeypressToApplication(key, appName)
  hs.hotkey.bind(hyper, key, function() 
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
bindKeypressToApplication("o", "Spark")
bindKeypressToApplication("s", "Slack")
bindKeypressToApplication("v", "Sublime Text")

-- key remappings --
hs.hotkey.bind(hyper, ".", hs.reload)
remapKey("w", "Up")
remapKey("a", "Left")
remapKey("s", "Down")
remapKey("d", "Right")

-- notifications --
hs.notify.new({ title="Hammerspoon", informativeText="Config reloaded." }):send()

