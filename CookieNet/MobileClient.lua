local w, h = term.getSize()
-- A Pocket Computer is 26 x 20 (w x h)

function printCentered(sText)
    local w, h = term.getSize()
    local x, y = term.getCursorPos()
    x = math.max(math.floor((w / 2) - (#sText / 2)), 0)
    term.setCursorPos(x, y)
		print(sText)
end

local function drawMainMenu()
		paintutils.drawFilledBox(0, 0, w, 1)

local function drawGPS
