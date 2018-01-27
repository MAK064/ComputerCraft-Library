-- getting the size of the display
local w, h = term.getSize()

-- drawing the background colours
local function drawBackground()
  paintutils.drawFilledBox(1,1,w,h,colours.black)
  paintutils.drawFilledBox(1,1,w,1,colours.orange)
end

-- draws the time
local function drawTime()
  while true do
    sleep(0)
    local time = os.time()
    term.setCursorPos(1,1)
    term.setTextColor(colours.black)
    term.setBackgroundColour(colours.orange)
    write(textutils.formatTime(time, false) .. " ")
  end
end

local function drawApps()
  calculator = paintutils.loadImage("Images/apps/calculator")
  cclicker = paintutils.loadImage("Images/apps/cclickers")
  IFTTT = paintutils.loadImage("Images/apps/IFTTT")
  maps = paintutils.loadImage("Images/apps/maps")
  settings = paintutils.loadImage("Images/apps/Settings")
  paintutils.drawImage(calculator, 2, 3)
  paintutils.drawImage(cclicker, 8, 3)
  paintutils.drawImage(IFTTT, 14, 3)
  paintutils.drawImage(maps, 20, 3)
  paintutils.drawImage(settings, 2, 8)
end

drawBackground()
drawApps()
drawTime()
