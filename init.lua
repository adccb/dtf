local hyper = { "shift", "alt", "ctrl", "cmd" }
local meh =  { "alt", "ctrl", "cmd" }

APP_MAP = {
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
}

for key, application in pairs(APP_MAP) do
  hs.hotkey.bind(hyper, key, function() 
    hs.application.launchOrFocus(application)
  end)
end

KEY_MAP = {
  w="Up",
  a="Left",
  s="Down",
  d="Right",
}

for pressed, target in pairs(KEY_MAP) do
  hs.hotkey.bind(meh, pressed, function()
    hs.eventtap.keyStroke(nil, target)
  end)
end
