hs = hs

-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
-- 	hs.alert.show("Hello World!")
-- end)

local hyper = { "cmd" }

-- Function to get ordered space IDs for the current screen
local function getSpaceIDs()
	local allSpaces = hs.spaces.allSpaces()
	local mainScreen = hs.screen.mainScreen():getUUID()
	return allSpaces[mainScreen]
end

-- Bind keys 1-9 to switch to spaces 1-9
for i = 1, 9 do
	hs.hotkey.bind(hyper, tostring(i), function()
		local spaces = getSpaceIDs()
		if spaces and spaces[i] then
			hs.spaces.gotoSpace(spaces[i])
		end
	end)
end
