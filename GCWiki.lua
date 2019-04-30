-- Earth's Moon
-- Mars
-- Venus
-- Jupiter
-- Saturn
-- Uranus
-- Neptune
-- Pluto
-- Eris
 
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
    m.setCursorPos(20, 16)
    print("Thermal Tier:")
    m.setCursorPos(20, 17)
    print("Gravity:")
    m.setCursorPos(20, 18)
    print("Km from Earth:")
end
 
local tier = "thing" --Creating the variables to contain the info for the information section.
local ores = "thing"
local specialty = "thing"
local villages = "thing"
local dungeons = "thing"
local boss = "thing"
local thermal = "thing"
local gravity = "thing"
local distance = "thing"
 
local function drawInfo() -- creates the information on the screen, depending on the planet you have selected
    m.setBackgroundColour(colours.grey)
    m.setTextColour(colours.black)
    m.setCursorPos(26, 7)
    write(tier)
    m.setCursorPos(26, 8)
    write(ores)
    m.setCursorPos(26, 9)
    write(ores2)
    m.setCursorPos(26, 10)
    write(ores3)
    m.setCursorPos(31, 11)
    write(specialty)
    m.setCursorPos(30, 12)
    write(villages)
    m.setCursorPos(30, 13)
    write(dungeons)
    m.setCursorPos(26, 14)
    write(boss)
    m.setCursorPos(34, 16)
    write(thermal)
    m.setCursorPos(29, 17)
    write(gravity)
    m.setCursorPos(35, 18)
    write(distance)
end
 
local function drawTitle()
    m.setCursorPos(23,1)
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.cyan)
    print("GC WIKI")     --Title
    print(string.rep("=", w))
    term.setBackgroundColour(colours.grey)
end
 
local function drawMoon() -- Creates the moon picture, (W,H)
    paintutils.drawFilledBox(4,7,13,13, colours.lightGrey) -- main body colour
 
    paintutils.drawPixel(5,9, colours.grey)
    paintutils.drawPixel(7,12, colours.grey) -- W,H,Colour
    paintutils.drawPixel(10,10, colours.grey)
    paintutils.drawPixel(8,8, colours.grey)
    paintutils.drawPixel(11,12, colours.grey)
    paintutils.drawPixel(12,9, colours.grey)
 
    paintutils.drawPixel(4,7, colours.grey) --grey edges to make it look like a circle
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
end
 
local function drawEarth() -- Creates the earth picture, (W,H)
    paintutils.drawFilledBox(4,7,13,13, colours.blue)-- main body colour
 
    paintutils.drawFilledBox(4,7,7,10, colours.green) -- earth's land
    paintutils.drawFilledBox(10,9,13,11, colours.green)
    paintutils.drawFilledBox(4,12,6,13, colours.green)
    paintutils.drawPixel(7,13, colours.green)
    paintutils.drawPixel(8,7, colours.green)
    paintutils.drawPixel(11,12, colours.green)
    paintutils.drawPixel(12,12, colours.green)
    paintutils.drawPixel(9,10, colours.green)
 
    paintutils.drawPixel(4,7, colours.grey) --grey edges to make it look like a circle
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
end
 
local function drawMars() -- Creates the mars picture, (W,H)
    paintutils.drawFilledBox(4,7,13,13, colours.red) -- main body colour
 
    paintutils.drawPixel(5,9, colours.orange)
    paintutils.drawPixel(7,12, colours.orange) -- W,H,Colour
    paintutils.drawPixel(10,10, colours.orange)
    paintutils.drawPixel(8,8, colours.orange)
    paintutils.drawPixel(11,12, colours.orange)
    paintutils.drawPixel(12,9, colours.orange)
 
    paintutils.drawPixel(4,7, colours.grey) --grey edges to make it look like a circle
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
end
 
local function drawVenus() -- Creates the venus picture, (W,H)
    paintutils.drawFilledBox(4,7,13,13, colours.yellow) -- main body colour
 
    paintutils.drawPixel(5,9, colours.orange)
    paintutils.drawPixel(7,12, colours.orange) -- W,H,Colour
    paintutils.drawPixel(10,10, colours.orange)
    paintutils.drawPixel(8,8, colours.orange)
    paintutils.drawPixel(11,12, colours.orange)
    paintutils.drawPixel(12,9, colours.orange)
 
    paintutils.drawPixel(4,7, colours.grey) --grey edges to make it look like a circle
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
end
 
local function drawJupiter() -- Creates the Jupiter picture, (W,H)
    paintutils.drawFilledBox(4,7,13,13, colours.yellow) -- main body colour
 
    paintutils.drawPixel(5,9, colours.orange)
    paintutils.drawPixel(7,12, colours.orange) -- W,H,Colour
    paintutils.drawPixel(10,10, colours.orange)
    paintutils.drawPixel(8,8, colours.orange)
    paintutils.drawPixel(11,12, colours.orange)
    paintutils.drawPixel(12,9, colours.orange)
 
    paintutils.drawPixel(4,7, colours.grey) --grey edges to make it look like a circle
    paintutils.drawPixel(13,7, colours.grey)
    paintutils.drawPixel(4,13, colours.grey)
    paintutils.drawPixel(13,13, colours.grey)
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
 
    tier = "Tier 1 Rocket"
    ores = "Copper, Tin, Cheese,"
    ores2 = "Meteoric Iron"
    ores3 = "  "
    specialty = "Meteorites"
    villages = "Yes"
    dungeons = "Yes"
    boss = "Evolved Skeleton"
    thermal = "N/A"
    gravity = "18%"
    distance = "384,400"
 
    drawInfo()
    drawMoon()
elseif planet == "earth" then
    print("Earth")
 
    tier = "Tier 1 Rocket"
    ores = "Coal, Iron, Gold, Lapis,"
    ores2 = "Tin, Silicon, Diamond,"
    ores3 = "Redstone, Emerald, etc."
    specialty = "Breathable Oxygen"
    villages = "Yes"
    dungeons = "Yes"
    boss = "Ender Dragon"
    thermal = "N/A"
    gravity = "100%"
    distance = "N/A"
 
    drawInfo()
    drawEarth()
elseif planet == "mars" then
    print("Mars")
 
    tier = "Tier 2 Rocket"
    ores = "Copper, Tin, Desh, Iron,"
    ores2 = "Meteoric Iron"
    ores3 = " "
    specialty = "Meteorites"
    villages = "No"
    dungeons = "Yes"
    boss = "Evolved Creeper"
    thermal = "Tier 1"
    gravity = "38%"
    distance = "54,600,000"
 
    drawInfo()
    drawMars()
elseif planet == "venus" then
    print("Venus")
 
    tier = "Tier 3 Rocket"
    ores = "Carbon, Iron, Tin, Copper"
    ores2 = " "
    ores3 = " "
    specialty = "Volcanoes"
    villages = "Yes"
    dungeons = "Yes"
    boss = "Evolved Magma Cube"
    thermal = "Tier 2"
    gravity = "91%"
    distance = "54,600,000"
 
    drawInfo()
    drawVenus()
elseif planet == "jupiter" then
    print("Jupiter")
 
    tier = "Tier 4 Rocket"
    ores = "Palladium, Nickel, Red Gems,"
    ores2 = "Iron, Tin, Copper"
    ores3 = " "
    specialty = "Magma and Constant Lightning"
    villages = "Yes"
    dungeons = "Yes"
    boss = "Evolved Creeper"
    thermal = "Tier 2"
    gravity = "91%"
    distance = "54,600,000"
 
    drawInfo()
    drawJupiter()
end
