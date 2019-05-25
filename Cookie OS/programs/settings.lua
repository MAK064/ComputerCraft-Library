--loading the config file
local lines = {}
local cfg = fs.open( "programs/config", "r" )
for line in cfg.readLine do
    lines[#lines+1] = line
end
cfg.close()

--[[
The config is now saved as a table, and each line of the config may be called using:
For line x = lines[x]
To write to config or change that one specific line, use:
lines[y] = foo
]]

--Load configurable settings
bgColour = lines[1]
fastBoot = lines[2]

-- getting the size of the display
local w, h = term.getSize()

-- drawing the background colours
local function drawBackground()
  paintutils.drawFilledBox(1,2,w,h,colours.lightGrey)
end

-- draws the header with the time, and maybe I'll add some more stuff if I can be bothered
local function drawHeader()
  while true do
    sleep(0)
    local time = os.time()
    term.setCursorPos(1,1)
    term.setTextColour(colours.black)
    term.setBackgroundColour(colours.orange)
    write(textutils.formatTime(time, false) .. " ")
  end
end

local function drawExit()
  term.setBackgroundColour(colours.red)
  term.setTextColour(colours.white)
  term.setCursorPos(2, h-1)
  print("EXIT")
end

local function drawTriggers() -- Matt is triggered
  -- Background colour
  paintutils.drawFilledBox(2,3,4,4,colours[bgColour])
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(6,3)
  write("Change Background")
  term.setCursorPos(6,4)
  write("Colour")
  -- Fast Boot on or off
  if fastBoot == "yes" then
    paintutils.drawFilledBox(2,6,3,6,colours.grey)
    paintutils.drawPixel(3,6,colours.lime)
  else
    paintutils.drawFilledBox(2,6,3,6,colours.grey)
    paintutils.drawPixel(2,6,colours.red)
  end
  term.setBackgroundColour(colours.lightGrey)
  term.setCursorPos(5,6)
  write("Fast Boot")
end

local function colourSelectPrompt(x,y)
  --Drawing in the Pallette
  backgroundColourSelector = paintutils.loadImage("images/backgroundColourSelector")
  paintutils.drawImage(backgroundColourSelector, x, y)
  --Making a fancy title
  term.setBackgroundColour(colours.orange)
  term.setTextColour(colours.black)
  term.setCursorPos(x+3,y)
  write("Select a")
  term.setCursorPos(x+4,y+1)
  write("Colour")
  -- using the exit GUI

  while true do
    local event, button, ex, ey = os.pullEventRaw("mouse_click") -- It enables you to select with the mouse
    if (event == "mouse_click" and ex >= x and x+13 >= ex and ey >= y and y+13 >= ey) then -- if you click in the window zone
      -- row 1
      if (event == "mouse_click" and ex >= x+1 and x+2 >= ex and ey >= y+3 and y+4 >= ey) then -- If you click on 'white'
        lines[1] = "white" -- Sets the config colour to white
        return
      elseif (event == "mouse_click" and ex >= x+4 and x+5 >= ex and ey >= y+3 and y+4 >= ey) then -- If you click on 'light Grey'
        lines[1] = "lightGrey" -- Sets the config colour to lightGrey
        return
      elseif (event == "mouse_click" and ex >= x+7 and x+8 >= ex and ey >= y+3 and y+4 >= ey) then -- If you click on 'grey'
        lines[1] = "grey" -- Sets the config colour to grey
        return
      elseif (event == "mouse_click" and ex >= x+10 and x+11 >= ex and ey >= y+3 and y+4 >= ey) then -- If you click on 'black'
        lines[1] = "black" -- Sets the config colour to black
        return
      -- row 2
      elseif (event == "mouse_click" and ex >= x+1 and x+2 >= ex and ey >= y+6 and y+7 >= ey) then -- If you click on 'red'
        lines[1] = "red" -- Sets the config colour to red
        return
      elseif (event == "mouse_click" and ex >= x+4 and x+5 >= ex and ey >= y+6 and y+7 >= ey) then -- If you click on 'orange'
        lines[1] = "orange" -- Sets the config colour to orange
        return
      elseif (event == "mouse_click" and ex >= x+7 and x+8 >= ex and ey >= y+6 and y+7 >= ey) then -- If you click on 'yellow'
        lines[1] = "yellow" -- Sets the config colour to yellow
        return
      elseif (event == "mouse_click" and ex >= x+10 and x+11 >= ex and ey >= y+6 and y+7 >= ey) then -- If you click on 'brown'
        lines[1] = "brown" -- Sets the config colour to brown
        return
      -- row 3
      elseif (event == "mouse_click" and ex >= x+1 and x+2 >= ex and ey >= y+9 and y+10 >= ey) then -- If you click on 'blue'
        lines[1] = "blue" -- Sets the config colour to blue
        return
      elseif (event == "mouse_click" and ex >= x+4 and x+5 >= ex and ey >= y+9 and y+10 >= ey) then -- If you click on 'cyan'
        lines[1] = "cyan" -- Sets the config colour to cyan
        return
      elseif (event == "mouse_click" and ex >= x+7 and x+8 >= ex and ey >= y+9 and y+10 >= ey) then -- If you click on 'lightBlue'
        lines[1] = "lightBlue" -- Sets the config colour to lightBlue
        return
      elseif (event == "mouse_click" and ex >= x+10 and x+11 >= ex and ey >= y+9 and y+10 >= ey) then -- If you click on 'pink'
        lines[1] = "pink" -- Sets the config colour to pink
        return
      -- row 4
      elseif (event == "mouse_click" and ex >= x+1 and x+2 >= ex and ey >= y+12 and y+13 >= ey) then -- If you click on 'green'
        lines[1] = "green" -- Sets the config colour to green
        return
      elseif (event == "mouse_click" and ex >= x+4 and x+5 >= ex and ey >= y+12 and y+13 >= ey) then -- If you click on 'lime'
        lines[1] = "lime" -- Sets the config colour to lime
        return
      elseif (event == "mouse_click" and ex >= x+7 and x+8 >= ex and ey >= y+12 and y+13 >= ey) then -- If you click on 'purple'
        lines[1] = "purple" -- Sets the config colour to purple
        return
      elseif (event == "mouse_click" and ex >= x+10 and x+11 >= ex and ey >= y+12 and y+13 >= ey) then -- If you click on 'magenta'
        lines[1] = "magenta" -- Sets the config colour to magenta
        return
      end
    else
      return
    end
  end
end

local function runSelection()
  while true do
    local event, button, x, y = os.pullEventRaw() -- when there is user interaction
    if (event == "mouse_click" and x >= 2 and y >= 3 and x <= 25 and y <= 4) then -- if clicked on the Colour Select
      colourSelectPrompt(4,5)
      bgColour = lines[1]
      drawBackground()
      drawTriggers()
      drawExit()
    elseif (event == "mouse_click" and x >= 2 and x <= 3 and y == 6) then -- if clicked on the Fast Boot
      if fastBoot == "yes" then
        lines[2] = "no"
      else
        lines[2] = "yes"
      end
      fastBoot = lines[2]
      drawTriggers()
    elseif (event == "mouse_click" and x >= 2 and x <= 5 and y == h-1) then -- if clicked on exit
      break
    end
  end
end

drawBackground()
drawTriggers()
drawExit()
parallel.waitForAny(drawHeader, runSelection)

local h = fs.open( "programs/config", "w" )
for i = 1, #lines do
  h.writeLine( lines[i] )
end
h.close()

shell.run("main.lua")
