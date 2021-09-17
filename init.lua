local hyper = { "shift", "alt", "ctrl", "cmd" }
local meh =  { "alt", "ctrl", "cmd" }

local HEAD_DOWN = false

-- utility functions --
function iff(condition, if_true, if_false)
  if condition then return if_true else return if_false end
end

function bindKeypressToApplication(key, appName)
  hs.hotkey.bind(hyper, key, function() 
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
APP_MAP = {
  c="Google Chrome",
  d="iTerm",
  e="Discord",
  j="jira",
  l="calendar",
  p="signal",
  r="Spotify",
  s="Slack",
  z="zoom.us",
  t="todoist",
  m="Messages",
  o="Obsidian"
}

HEAD_DOWN_MAP = {
  c="Google Chrome",
  d="iTerm",
  j="jira",
}

ACTIVE_MAP = iff(HEAD_DOWN, HEAD_DOWN_MAP, APP_MAP)
for key, application in pairs(ACTIVE_MAP) do
  bindKeypressToApplication(key, application)
end

-- key remappings --
remapKey("w", "Up")
remapKey("a", "Left")
remapKey("s", "Down")
remapKey("d", "Right")
remapKey("r", "pageup")
remapKey("f", "pagedown")

-- auto-reload
hs.pathwatcher.new("~/.hammerspoon/init.lua", hs.reload):start()
hs.notify.new({ title="hammerspoon", informativeText="config reloaded" }):send()
