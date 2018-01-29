-- Initial Startup
os.setComputerLabel("100")

local modem = peripheral.wrap("back")
local m = peripheral.wrap("right")
local w, h = m.getSize()

term.setBackgroundColour(256)
paintutils.drawFilledBox(0,0,w,3,colours.green)
term.setCursorPos(w-3, 2)
m.print("ONLINE")

modem.open(100)

modem.open(1)
modem.open(10)
modem.open(11)
modem.open(2)
modem.open(20)
modem.open(21)

if true do
local side, frequency, replyFrequency, message = os.pullEvent(modem_message)
if frequency = 1
  then modem.transmit(10, replyFrequency, message)
  modem.transmit(11 replyFrequency, message)
  
  elseif frequency = 2
  then modem.transmit(20, replyFrequency, message)
  modem.transmit(21, replyFrequency, message)
  
  elseif frequency = 100
  then m.print(frequency : message)
  
  else modem.transmit(replyFrequency, 100, "The contact you have specified could not be found")
end
