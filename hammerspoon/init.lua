local hyper = { "alt" }

-- hammerspoon reloads --
hs.hotkey.bind(hyper, ".", hs.reload)

-- applications --
hs.hotkey.bind(hyper, "d", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "c", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "t", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind(hyper, "o", function()
  hs.application.launchOrFocus("Microsoft Outlook")
end)

hs.hotkey.bind(hyper, "v", function()
  hs.application.launchOrFocus("MacVim")
end)

hs.hotkey.bind(hyper, "s", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "f", function()
  hs.application.launchOrFocus("Spotify")
end)

-- switching spaces --
hs.hotkey.bind({ "ctrl" }, "right", function()
  hs.eventtap.keyStroke(nil, "f14")
end)

hs.hotkey.bind({ "ctrl" }, "left", function()
  hs.eventtap.keyStroke(nil, "f13")
end)

hs.hotkey.bind({ "ctrl" }, "j", function()
  hs.eventtap.keyStroke(nil, "f13")
end)

hs.hotkey.bind({ "ctrl" }, ";", function()
  hs.eventtap.keyStroke(nil, "f14")
end)

-- hjkl lol --
hs.hotkey.bind(hyper, "j", function()
  hs.eventtap.keyStroke(nil, "left")
end)

hs.hotkey.bind(hyper, "k", function()
  hs.eventtap.keyStroke(nil, "down")
end)

hs.hotkey.bind(hyper, "l", function()
  hs.eventtap.keyStroke(nil, "up")
end)

hs.hotkey.bind(hyper, ";", function()
  hs.eventtap.keyStroke(nil, "right")
end)

hs.hotkey.bind(hyper, "i", function()
  hs.eventtap.keyStroke(nil, "pageup")
end)

hs.hotkey.bind(hyper, "n", function()
  hs.eventtap.keyStroke(nil, "pagedown")
end)

hs.hotkey.bind(hyper, "0", function()
  hs.eventtap.keyStroke(nil, "home")
end)

hs.hotkey.bind({ "alt", "shift" }, "4", function()
  hs.eventtap.keyStroke(nil, "end")
end)

-- FREEDOM FROM ~ --
hs.hotkey.bind(hyper, "o", function()
  hs.eventtap.keyStrokes('~')
end)

-- show me the date --
hs.hotkey.bind(hyper, "e", function()
  time = os.date('%a %d %b %Y @ %I:%M %p'):lower()
  hs.notify.new({ title="local time", informativeText=time }):send()
end)

-- find my mouse --
hs.hotkey.bind(hyper, "x", function()
  diameter = 50
  delay = 1

  mousepoint = hs.mouse.getAbsolutePosition ()
  circle = hs.drawing.circle(
    hs.geometry.rect(
      mousepoint.x - (diameter / 2),
      mousepoint.y - (diameter / 2),
      diameter,
      diameter
    )
  )
  :setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
  :setFill(false)
  :setStrokeWidth(2)
  :show()

  hs.timer.doAfter(delay, function() circle:delete() end)
end)

-- notifications --
hs.notify.new({ title="Hammerspoon", informativeText="Config reloaded." }):send()
