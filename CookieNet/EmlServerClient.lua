-- Initial Startup
os.setComputerLabel("100")

local modem = peripheral.wrap("back")
local m = peripheral.wrap("right")
local w, h = m.getSize()
m.setBackgroundColour(colours.grey)
paintutils.drawLine(0,0,w,h,colours.green)

modem.open(100)

-- Example Code
