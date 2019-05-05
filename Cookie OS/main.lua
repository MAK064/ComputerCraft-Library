--loading the config file
local lines = {}
local cfg = fs.open( "programs/config", "r" )
for line in cfg.readLine do
    lines[#lines+1] = line
end
cfg.close()

--[[
The config is now saved as a table, and each line of the config may be called using:
For line x = lines[x]
To write to config or change that one specific line, use:
lines[y] = foo
]]

--Load configurable settings

bgColour = lines[1]

-- getting the size of the display
local w, h = term.getSize()

-- drawing the background colours
local function drawBackground()
  paintutils.drawFilledBox(1,1,w,h,colours[bgColour])
end

-- draws the header with the time, and maybe I'll add some more stuff if I can be bothered, it's not like there's a battery though.
local function drawHeader()
  paintutils.drawFilledBox(1,1,w,1,colours.orange)
  while true do
    sleep(0)
    local time = os.time()
    term.setCursorPos(1,1)
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.orange)
    write(textutils.formatTime(time, false) .. " ")
  end
end

local function drawApps()
  calculator = paintutils.loadImage("images/apps/calculator")
  cclicker = paintutils.loadImage("images/apps/cclickers")
  IFTTT = paintutils.loadImage("images/apps/IFTTT")
  maps = paintutils.loadImage("images/apps/maps")
  settings = paintutils.loadImage("images/apps/settings")
  paintutils.drawImage(settings, 2, 3)
  paintutils.drawImage(calculator, 8, 3)
  paintutils.drawImage(IFTTT, 14, 3)
  paintutils.drawImage(maps, 20, 3)
  paintutils.drawImage(cclicker, 2, 8)
end

local function runSelection()
  while true do
      local event, button, x, y = os.pullEventRaw() -- when there is user interaction
      if (event == "mouse_click" and x >= 2 and y >= 3 and x <= 6 and y <= 6) then -- and if that mouse click is on the 1st app
        shell.run("programs/settings.lua")
      end
      if (event == "mouse_click" and x >= 2 and y >= 8 and x <= 6 and y <= 11) then -- and if that mouse click is on the 2nd app
        shell.run("programs/cclicker.lua")
      end
  end
end

drawBackground()
drawApps()
parallel.waitForAny(drawHeader, runSelection)
