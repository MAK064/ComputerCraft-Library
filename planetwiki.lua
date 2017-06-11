--Wrapping the monitor
local m = peripheral.wrap("right")
local w, h = m.getSize()

-- Functions to draw the menu
local function drawMenuColour() -- creates the colours of the menu
    paintutils.drawFilledBox(0, 0, w, h, colours.grey) -- Bottom Grey
    paintutils.drawFilledBox(0, 0, w, 2, colours.cyan) -- top 2 Cyan
end

local function drawHeadings() -- creates the Info headings for the planets
    m.setBackgroundColour(colours.grey)
    m.setTextColour(colours.lightGrey)
    m.setCursorPos(20, 7)
    print("Tier:")
    m.setCursorPos(20, 8)
    print("Ores:")
    m.setCursorPos(20, 11)
    print("Specialty:")
    m.setCursorPos(20, 12)
    print("Villages:")
    m.setCursorPos(20, 13)
    print("Dungeons:")
    m.setCursorPos(20, 14)
    print("Boss:")
end

local tier = "thing" --Creating the variables to contain the info for the information section.
local ores = "thing"
local specialty = "thing"
local villages = "thing"
local dungeons = "thing"
local boss = "thing"

local function drawInfo() -- creates the information on the screen, depending on the planet you have selected
    m.setBackgroundColour(colours.grey)
    m.setTextColour(colours.black)
    m.setCursorPos(26, 7)
    write(tier)
    m.setCursorPos(26, 8)
    write(ores)
    m.setCursorPos(31, 11)
    write(specialty)
    m.setCursorPos(30, 12)
    write(villages)
    m.setCursorPos(30, 13)
    write(dungeons)
    m.setCursorPos(26, 14)
    write(boss)
end

local function drawTitle()
    m.setCursorPos(23,1)
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.cyan)
    print("GC WIKI")     --Title
    print(string.rep("=", w))
    term.setBackgroundColour(colours.grey)
end

local function drawMoon() -- Creates the moon picture
    paintutils.drawFilledBox(4,7,13,13, colours.lightGrey)
    paintutils.drawPixel(4,7, colours.grey)
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
    paintutils.drawPixel(5,9, colours.black)
    paintutils.drawPixel(7,12, colours.black) -- W,H,Colour
    paintutils.drawPixel(10,10, colours.black)
    paintutils.drawPixel(8,8, colours.black)
    paintutils.drawPixel(11,12, colours.black)
    paintutils.drawPixel(12,9, colours.black)
end

--Time to get started with the actual program :D

m.setBackgroundColour(colours.grey)
term.clear() -- Clears in the beginning, then shows GC Wiki Startup page
m.clear()
m.setTextScale(3)
m.setCursorPos(2,2)
m.setTextColour(colours.cyan)
m.write("GC ")
m.setTextColour(colours.lightGrey)
m.write("Wiki")
m.setBackgroundColour(colours.lightGrey)
m.setTextColour(colours.grey)
m.setCursorPos(1,6)
m.write("By Kyle Phillips                 .")

-- Enter in the planet you want to view in the console
term.setCursorPos(1, 1)
print("Avaliable Planets to view:")
print("Moon, Earth, Mars, Venus, Jupiter")
term.setCursorPos(1, 4)
print("Enter the planet you would like to display:")
local planet = read()
m.clear()
term.redirect(m)

--Drawing the menu

term.clear()
m.clear()
m.setCursorPos(1,1)
m.setTextScale(1)
drawMenuColour()    --Menu Colour
drawTitle()
drawHeadings()
m.setCursorPos(20,5)
m.setBackgroundColour(colours.grey)
m.setTextColour(colours.white)
if planet == "moon" then
    print("Earth's Moon")
    drawMoon()

    tier = "Tier 1 Rocket"
    ores = "Copper, Tin, Meteoric Iron, Cheese"
    specialty = "Meteorites"
    villages = "Yes"
    dungeons = "Yes"
    boss = "Evolved Skeleton"

    drawInfo()
end