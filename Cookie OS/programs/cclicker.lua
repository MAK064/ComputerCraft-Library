local w, h = term.getSize() -- First getting the size of the computer screen display
menustate = "cookie"
terminate = false
cookies = 0
cps = 0

function round(n)
  return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function printCentered(sText)
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
    print(sText)
end

local function drawMenuColour() -- creates the colours of the menu
    paintutils.drawFilledBox(0, 0, w, h, colours.grey) -- Bottom Grey
    paintutils.drawFilledBox(0, 0, w, 2, colours.orange) -- top 2 Cyan
end

local function drawTitle()
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.orange)
    term.setCursorPos(12,1)
    print("- CCLICKERS")     --Title
    print(string.rep("=", w))
    term.setBackgroundColour(colours.lightGrey)
end

local function drawHeadings() -- creates the game statistic displays
  if menustate == "cookie" then
    term.setBackgroundColour(colours.grey)
    term.setTextColour(colours.lightGrey)
    paintutils.drawLine(2,4,27,4, colours.grey)
    term.setCursorPos(2, 4)
    print("Cookies:", cookies)
    paintutils.drawLine(2,5,27,5, colours.grey)
    term.setCursorPos(2,5)
    print("CPS:", cps)
  end
end

local function drawCookie()
  if menustate == "cookie" then
    paintutils.drawFilledBox(4,7,13,13, colours.orange)
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
end

local function drawExit()
  term.setBackgroundColour(colours.red)
  term.setTextColour(colours.white)
  term.setCursorPos(2, h-1)
  print("EXIT")
end

local function drawMenuSwap()
  term.setBackgroundColour(colours.blue)
  term.setTextColor(colours.white)
  term.setCursorPos(w-4, h-1)
  if menustate == "cookie" then
    print("SHOP")
  else
    print("BACK")
  end
end

local function exitPrompt()
  --making fancy boxes
  paintutils.drawFilledBox(2,6,25,14, colours.black)
  paintutils.drawFilledBox(2,6,25,7, colours.orange)
  --Making a fancy title
  term.setBackgroundColour(colours.orange)
  term.setTextColour(colours.black)
  term.setCursorPos(9,6)
  print("EXIT MENU")
  term.setCursorPos(2,7)
  print(string.rep("=", 24))
  --making fancy text
  term.setBackgroundColour(colours.black)
  term.setTextColour(colours.white)
  term.setCursorPos(3, 9)
  print("Are you sure you want")
  term.setCursorPos(9,10)
  print("to exit?")
  --Making fancy Yes/No boxes
  term.setBackgroundColour(colours.green)
  term.setCursorPos(9, 12)
  print("YES")
  term.setBackgroundColour(colours.red)
  term.setCursorPos(15, 12)
  print("NO ")
  -- using the exit GUI
  while true do
    local event, button, x, y = os.pullEventRaw("mouse_click") -- It enables you to select with the mouse
    if (event == "mouse_click" and x >= 1  and 25 >= x and y >= 6  and 14 >= y) then -- if you click in the window zone
      if (event == "mouse_click" and x >= 9 and 11 >= x and y == 12) then -- and if you also click on the 'YES'
        return true
      elseif (x >= 15 and 18 >= x and y == 12) then -- and if you also click on the 'NO'
        return false
      end
    elseif button == 28 then -- If you hit enter
      return true
    else
      return false
    end
  end
end

pickaxePrice = 25
villagerPrice = 75
farmPrice = 300
minePrice = 1000
factoryPrice = 7500
portalPrice = 25000

--loading the save file
local lines = {}
local cfg = fs.open( "programs/cclicker.save", "r" )
for line in cfg.readLine do
    lines[#lines+1] = line
end
cfg.close()

--[[
The save file is now saved as a table, and each line of the save data may be called using:
For line x = lines[x]
To write to the save file or change one specific line, use:
lines[y] = foo
]]

--Load save file
cookies = round(lines[1])
pickaxeAmount = round(lines[2])
villagerAmount = round(lines[3])
farmAmount = round(lines[4])
mineAmount = round(lines[5])
factoryAmount = round(lines[6])
portalAmount = round(lines[7])

local function drawUpgrades()
  drawMenuSwap()
  if menustate == "upgrades" then
    --PICKAXE Upgrade menu
    if cookies >= pickaxePrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-24, 4, w-14, 7, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-24, 4, w-14, 7, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    -- Writing the text
    term.setCursorPos(w-22,4)
    print("Pickaxe")
    term.setCursorPos(w-22,5)
    print("0.3 CPS")
    term.setCursorPos(w-22,6)
    print("$",pickaxePrice)
    term.setCursorPos(w-22,7)
    print("Own: ",pickaxeAmount)

    --VILLAGER upgrade menu
    if cookies >= villagerPrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-11, 4, w-1, 7, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-11, 4, w-1, 7, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    --Writing the text
    term.setCursorPos(w-10,4)
    print("Villager")
    term.setCursorPos(w-10,5)
    print("1 CPS")
    term.setCursorPos(w-10,6)
    print("$",villagerPrice)
    term.setCursorPos(w-10,7)
    print("Own: ",villagerAmount)

    -- FARM upgrade menu
    if cookies >= farmPrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-24, 9, w-14, 12, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-24, 9, w-14, 12, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    --Writing the text
    term.setCursorPos(w-22,9)
    print("Farm")
    term.setCursorPos(w-22,10)
    print("3 CPS")
    term.setCursorPos(w-22,11)
    print("$",farmPrice)
    term.setCursorPos(w-22,12)
    print("Own: ",farmAmount)

    --Mine Upgrade Menu
    if cookies >= minePrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-11, 9, w-1, 12, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-11, 9, w-1, 12, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    --Writing the text
    term.setCursorPos(w-10,9)
    print("Mine")
    term.setCursorPos(w-10,10)
    print("5 CPS")
    term.setCursorPos(w-10,11)
    print("$",minePrice)
    term.setCursorPos(w-10,12)
    print("Own: ",mineAmount)

    --Factory Upgrade Menu
    if cookies >= factoryPrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-24, 14, w-14, 17, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-24, 14, w-14, 17, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    --Writing the text
    term.setCursorPos(w-22,14)
    print("Factory")
    term.setCursorPos(w-22,15)
    print("15 CPS")
    term.setCursorPos(w-22,16)
    print("$",factoryPrice)
    term.setCursorPos(w-22,17)
    print("Own: ",factoryAmount)

    --Portal Upgrade Menu
    if cookies >= portalPrice then -- If you have enough money, it's green
      paintutils.drawFilledBox(w-11, 14, w-1, 17, colours.green)
      term.setTextColour(colours.black)
      term.setBackgroundColour(colours.green)
    else -- If you don't have enough money, it's red
      paintutils.drawFilledBox(w-11, 14, w-1, 17, colours.red)
      term.setTextColour(colours.white)
      term.setBackgroundColour(colours.red)
    end
    --Writing the text
    term.setCursorPos(w-10,14)
    print("Portal")
    term.setCursorPos(w-10,15)
    print("50 CPS")
    term.setCursorPos(w-10,16)
    print("$",portalPrice)
    term.setCursorPos(w-10,17)
    print("Own: ",portalAmount)
  end
end

-- Functions to run the game

local function runGame()
  while true do -- The continuous loop of the game
    drawTitle()
    drawExit()
    drawHeadings() -- draws in all the data
    local event, button, x, y = os.pullEventRaw() -- if there is a mouse click
    if menustate == "cookie" then -- if you're on the cookie page
      if (event == "mouse_click" and x >= 4  and 13 >= x and y >= 7  and 13 >= y) then -- and if that mouse click is on the cookie
        cookies = cookies + 1 -- you get more cookies
      end
      if (event == "mouse_click" and w-1 >= x and x >= w-4 and y == h-1) then -- If you hit SHOP / BACK
        menustate = "upgrades"
        drawMenuColour()
        drawUpgrades()
      end
    elseif menustate == "upgrades" then -- if you're on the menu page
      if (event == "mouse_click" and x >= w-24 and w-14 >= x and y >= 4 and 7 >= y) then -- PICKAXE CLICK
        if cookies >= pickaxePrice then
          cookies = cookies - pickaxePrice
          pickaxeAmount = pickaxeAmount + 1
        end
      end
      if (event == "mouse_click" and x >= w-11 and w-1 >= x and y >= 4 and 7 >= y) then -- VILLAGER CLICK
        if cookies >= villagerPrice then
          cookies = cookies - villagerPrice
          villagerAmount = villagerAmount + 1
        end
      end
      if (event == "mouse_click" and x >= w-23 and w-13 >= x and y >= 9 and 12 >= y) then -- FARM CLICK
        if cookies >= villagerPrice then
          cookies = cookies - farmPrice
          farmAmount = farmAmount + 1
        end
      end
      if (event == "mouse_click" and x >= w-11 and w-1 >= x and y >= 9 and 12 >= y) then -- MINE CLICK
        if cookies >= minePrice then
          cookies = cookies - minePrice
          mineAmount = mineAmount + 1
        end
      end
      if (event == "mouse_click" and x >= w-23 and w-13 >= x and y >= 14 and 17 >= y) then -- FACTORY CLICK
        if cookies >= factoryPrice then
          cookies = cookies - factoryPrice
          factoryAmount = factoryAmount + 1
        end
      end
      if (event == "mouse_click" and x >= w-11 and w-1 >= x and y >= 14  and 17 >= y) then -- PORTAL CLICK
        if cookies >= portalPrice then
          cookies = cookies - portalPrice
          portalAmount = portalAmount + 1
        end
      end
      if (event == "mouse_click" and w-1 >= x and x >= w-4 and y == h-1) then -- If you hit SHOP / BACK
        menustate = "cookie"
        drawMenuColour()
        drawCookie()
      end
    end
    if (event == "mouse_click" and 5 >= x and x >= 2 and y == h-1) then -- If you hit EXIT
      return
    end
    if event == "terminate" then
      break
    end
    cps = (pickaxeAmount*0.3) + (villagerAmount*1) + (farmAmount*3) + (mineAmount*5) + (factoryAmount*15) + (portalAmount*50)
    pickaxePrice = 25 + (pickaxeAmount*5)
    villagerPrice = 75 + (villagerAmount*20)
    farmPrice = 300 + (farmAmount*75)
    minePrice = 1000 + (mineAmount*350)
    factoryPrice = 7500 + (factoryAmount*1200)
    portalPrice = 25000 + (portalAmount*10000)
    drawUpgrades()
  end
end

local function runUpgrades()
  while true do -- continuously adding cookies every amount of seconds for the different runUpgrades
    sleep(1)
    cps = (pickaxeAmount*0.3) + (villagerAmount*1) + (farmAmount*3) + (mineAmount*5) + (factoryAmount*15) + (portalAmount*50)
    cookies = cookies + cps
    drawHeadings() -- draws in all the data
    drawUpgrades()
  end
end

-- Running the game

drawMenuColour()
drawTitle()
drawExit()
drawCookie()
drawUpgrades()

while true do
  parallel.waitForAny(runGame, runUpgrades)
  if exitPrompt() then
    break
  else
    drawMenuColour()
    drawTitle()
    drawExit()
    drawCookie()
  end
end

lines[1] = round(cookies)
lines[2] = round(pickaxeAmount)
lines[3] = round(villagerAmount)
lines[4] = round(farmAmount)
lines[5] = round(mineAmount)
lines[6] = round(factoryAmount)
lines[7] = round(portalAmount)

local h = fs.open( "programs/cclicker.save", "w" )
for i = 1, #lines do
  h.writeLine( lines[i] )
end
h.close()

shell.run("main.lua")
