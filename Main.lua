local players = game:GetService("Players")

local player = players.LocalPlayer
local character

local function character_added()
	character = player.Character
end

character_added()
player.CharacterAdded:Connect(character_added)

--# notifications

local notifLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local notifyFunction = notifLibrary.Notify

local function notify(title, text, dur)
	notifyFunction({
		Description = text;
		Title = title;
		Duration = dur
	})
end

--#

--# library

local keys = {
	"QWR-5206"; "YRH-2064"; "FHY-6021"; "AER-2023"; "LEA-1337"
}

local inputted_key = "ABC-1234"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/SplixUiLib/main/Main"))()
local window = library:new({
	textsize = 13.5,
	font = Enum.Font.RobotoMono,
	name = "Spelly HUB",
	color = BrickColor.Random().Color
})

local tab = window:page({
	name = "Loader"
})
local section = tab:section({
	name = "Insert Key",
	side = "left",
	size = 150
})
section:textbox({
	name = "Key",
	def = "ABC-1234",
	placeholder = "ABC-1234",
	callback = function(value)
		inputted_key = value
	end,
})
section:button({
	name = "Load",
	callback = function()
		--# validation
		if table.find(keys, inputted_key) then
			task.delay(1.5, function()
				window["screen"]:Destroy()
				print("validated successfuly")
				notify("spelly", "key validated successfuly", 5)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/aercvz/Spelly/main/main"))
			end)
		end
		--#
	end,
})

--#