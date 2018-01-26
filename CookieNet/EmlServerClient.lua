-- Initial Startup
os.setComputerLabel("100")
local modem = peripheral.wrap("back")
local m = peripheral.wrap("right")
local w, h = m.getSize()
modem.open(100)

-- Example Code
