local hyper = { "shift", "alt", "ctrl", "cmd" }
local meh =  { "alt", "ctrl", "cmd" }

KEYMAP = {
  apps = {
    f="Firefox",
    d="iTerm",
    e="Discord",
    p="signal",
    r="Spotify",
    z="zoom.us",
    t="todoist",
    m="Messages",
    o="Obsidian",
    s="Slack",
  },
  keybinds = {
    w="Up",
    a="Left",
    s="Down",
    d="Right",
  }
}

for key, application in pairs(KEYMAP.apps) do
  hs.hotkey.bind(hyper, key, function() 
    hs.application.launchOrFocus(application)
  end)
end

for pressed, target in pairs(KEYMAP.keybinds) do
  hs.hotkey.bind(meh, pressed, function()
    hs.eventtap.keyStroke(nil, target)
  end)
end

