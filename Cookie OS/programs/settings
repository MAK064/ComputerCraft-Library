-- getting the size of the display
local w, h = term.getSize()

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
  paintutils.drawFilledBox(2,3,3,3,colours.grey)
  paintutils.drawPixel(3,3,colours.lime)
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(5,3)
  write("Startup Splash")
end

term.setBackgroundColour

drawBackground()
drawTriggers()
drawHeader()
