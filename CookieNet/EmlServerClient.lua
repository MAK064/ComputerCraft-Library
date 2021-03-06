-- Initial Startup
os.setComputerLabel("100")

local modem = peripheral.wrap("back")
local m = peripheral.wrap("right")
local w, h = m.getSize()

m.setBackgroundColour(256)
m.drawFilledBox(0,0,w,3,colours.green)
m.setCursorPos((w/2)-3, 2)
m.print("ONLINE")

modem.open(100)

modem.open(1)
modem.open(10)
modem.open(11)
modem.open(2)
modem.open(20)
modem.open(21)

while true do
local side, frequency, replyFrequency, message = os.pullEvent(modem_message)
	if frequency ~= nil
		then print(replyFrequency .. ":" .. message)
		if frequency == 1
			then modem.transmit(10, replyFrequency, message)
			modem.transmit(11, replyFrequency, message)

		elseif frequency == 2
			then modem.transmit(20, replyFrequency, message)
			modem.transmit(21, replyFrequency, message)
		else
			modem.transmit(replyFrequency, 100, "The contact you have specified could not be found")
		end
	end
end
