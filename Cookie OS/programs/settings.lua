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

--Now time to load config settings

print(lines[1])
print(lines[2])
sleep(1)

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
  paintutils.drawFilledBox(2,3,3,4,bgColour)
  -- Startup splash on or off
  paintutils.drawFilledBox(2,3,3,3,colours.grey)
  paintutils.drawPixel(3,3,colours.lime)
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(5,3)
  write("Startup Splash")
end

drawBackground()
drawTriggers()
drawHeader()
