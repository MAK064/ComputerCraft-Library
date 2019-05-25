function setup ()
  os.setComputerLabel("100")

  local modem = peripheral.wrap("back")
  local m = peripheral.wrap("right")
  local w, h = m.getSize()

  m.setBackgroundColour(256)
  m.drawFilledBox(0,0,w,3,colours.green)
  m.setCursorPos((w/2)-3, 2)
  m.print("ONLINE")

  modem.open(100)
end



setup()
