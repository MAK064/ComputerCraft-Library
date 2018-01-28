-- getting the size of the display
local w, h = term.getSize()

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

-- drawing the background colours
local function drawBackground()
  paintutils.drawFilledBox(1,1,w,h,colours.lightGrey)
end

-- draws the header with the time, and maybe I'll add some more stuff if I can be bothered
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

local function drawTriggers() -- Matt is triggered
  -- Background colour
  paintutils.drawFilledBox(2,3,4,4,colours[bgColour])
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(6,3)
  write("Change Background")
  term.setCursorPos(6,4)
  write("Colour")
  -- Startup splash on or off
  paintutils.drawFilledBox(2,6,3,6,colours.grey)
  paintutils.drawPixel(3,6,colours.lime)
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(5,6)
  write("Startup Splash")
end

local function colourSelectPrompt(x,y)
  --Drawing in the Pallette
  backgroundColourSelector = paintutils.loadImage("images/backgroundColourSelector")
  paintutils.drawImage(backgroundColourSelector, x, y)
  --Making a fancy title
  term.setBackgroundColour(colours.orange)
  term.setTextColour(colours.black)
  term.setCursorPos(x+3,y)
  write("Select a")
  term.setCursorPos(x+4,y+1)
  write("Colour")
  -- using the exit GUI
  while true do
    local event, button, ex, ey = os.pullEventRaw("mouse_click") -- It enables you to select with the mouse
    if (event == "mouse_click" and ex >= x and x+13 >= ex and ey >= y and y+13 >= ey) then -- if you click in the window zone
      if (event == "mouse_click" and ex >= x+1 and x+2 >= ex and ey >= y+4 and y+5 >= ey) then -- If you click on 'White'
        lines[1] = "white" -- Sets the config colour to White
        local h = fs.open( "config", "w" )
        for i = 1, #lines do
            h.writeLine( lines[i] )
        end
        h.close()
      end
    end
  end
end

local function runSelection()
  while true do
      local event, button, x, y = os.pullEventRaw() -- when there is user interaction
      if (event == "mouse_click" and x >= 2 and y >= 3 and x <= 25 and y <= 4) then -- if clicked on the Colour Select
        colourSelectPrompt(4,5)
      end
  end
end

drawBackground()
drawTriggers()
parallel.waitForAny(drawHeader, runSelection)
