-- getting the size of the display
local w, h = term.getSize()

-- drawing the background colours
local function drawBackground()
  paintutils.drawFilledBox(1,1,w,h,colours.grey)
end

-- draws the header with the time, and maybe I'll add some more stuff if I can be bothered, it's not like there's a battery though.
local function drawHeader()
  paintutils.drawFilledBox(1,1,w,1,colours.orange)
end

local function drawExit()
  term.setBackgroundColour(colours.red)
  term.setTextColour(colours.white)
  term.setCursorPos(2, h-1)
  print("EXIT")
end

-- draws buttons
local function drawButtons()
	paintutils.drawFilledBox(2,3,w-1,5,colours.lightGrey)

	-- numbers
	paintutils.drawFilledBox(2,7,4,9,colours.lightGrey)
	paintutils.drawFilledBox(6,7,8,9,colours.lightGrey)
	paintutils.drawFilledBox(10,7,12,9,colours.lightGrey)
  paintutils.drawFilledBox(14,7,16,9,colours.lightGrey)

	paintutils.drawFilledBox(2,11,4,13,colours.lightGrey)
	paintutils.drawFilledBox(6,11,8,13,colours.lightGrey)
	paintutils.drawFilledBox(10,11,12,13,colours.lightGrey)
  paintutils.drawFilledBox(14,11,16,13,colours.lightGrey)

	paintutils.drawFilledBox(2,15,4,17,colours.lightGrey)
	paintutils.drawFilledBox(6,15,8,17,colours.lightGrey)
	paintutils.drawFilledBox(10,15,12,17,colours.lightGrey)
  paintutils.drawFilledBox(14,15,16,17,colours.green)

	paintutils.drawFilledBox(19,7,21,9,colours.orange)
	paintutils.drawFilledBox(23,7,25,9,colours.red)
	paintutils.drawFilledBox(19,11,21,13,colours.lightBlue)
	paintutils.drawFilledBox(23,11,25,13,colours.lightBlue)
	paintutils.drawFilledBox(19,15,21,17,colours.lightBlue)
	paintutils.drawFilledBox(23,15,25,17,colours.lightBlue)

  -- text
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(3,8)
  term.write("9")
  term.setCursorPos(7,8)
  term.write("8")
  term.setCursorPos(11,8)
  term.write("7")
  term.setCursorPos(3,12)
  term.write("6")
  term.setCursorPos(7,12)
  term.write("5")
  term.setCursorPos(11,12)
  term.write("4")
  term.setCursorPos(3,16)
  term.write("3")
  term.setCursorPos(7,16)
  term.write("2")
  term.setCursorPos(11,16)
  term.write("1")
  term.setCursorPos(15,8)
  term.write("0")
  term.setCursorPos(15,12)
  term.write(".")

  term.setBackgroundColour(colours.green)
  term.setCursorPos(15,16)
  term.write("=")

  term.setBackgroundColour(colours.orange)
  term.setCursorPos(20,8)
  term.write("<")

  term.setBackgroundColour(colours.red)
  term.setCursorPos(24,8)
  term.write("C")

  term.setBackgroundColour(colours.lightBlue)
  term.setCursorPos(20,12)
  term.write("+")
  term.setCursorPos(20,16)
  term.write("-")
  term.setCursorPos(24,12)
  term.write("x")
  term.setCursorPos(24,16)
  term.write("÷")
end

drawBackground()
drawHeader()
drawButtons()
drawExit()
