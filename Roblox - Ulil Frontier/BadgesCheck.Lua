local Players = game:GetService("Players")
local BadgeService = game:GetService("BadgeService")
local Menu = script.Parent

local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")

--LightControl
local Lighting = game:WaitForChild("Lighting")
local BackBlur = Lighting.BackBlur

local BadgesButton = Menu.BadgesMenu.BadgesButton
local BadgesFrame = Menu.BadgesMenu.MainFrame
local BackFrame = Menu.BadgesMenu.BackFrame
local MenuButton = Menu.MainMenu.MenuButton

-- Sidebar Buttons 
local ButtonsFrame = BadgesFrame.ButtonsFrame
local BackButton = ButtonsFrame.Back

-- Main
local Frames = BadgesFrame.Frames
local ScrollingFrame = Frames.ScrollingFrame

-- Description
local DescriptionFrame = Menu.BadgesMenu.Description
local BadgePVFrame = DescriptionFrame.BadgePV
local BadgePV = BadgePVFrame.ImageLabel

local Description = DescriptionFrame.Description
local DescriptionText = Description.Description
local TitleText = Description.Title
local NotesText = Description.Notes

-- Badges
local Badge1 = ScrollingFrame.Badge1
local Badge1ID = 1627954272426082
local hasBadge1 = false

local Badge2 = ScrollingFrame.Badge2
local Badge2ID = 16805236497060
local hasBadge2 = false

local Badge3 = ScrollingFrame.Badge3
local Badge3ID = 26484278080890
local hasBadge3 = false

local Badge4 = ScrollingFrame.Badge4
local Badge4ID = 3761010963817326
local hasBadge4 = false

local Badge5 = ScrollingFrame.Badge5
local Badge5ID = 2553970979983356
local hasBadge5 = false

--Sound
local SoundService = game:GetService("SoundService")
local UISound = SoundService.UIClick

-- Functions
local function UIClickSound()
	if not UISound.IsPlaying then
		UISound:Play()
	end
end

BadgesButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	BadgesFrame:TweenPosition(
		
		UDim2.new(0.739, 0,0, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	DescriptionFrame:TweenPosition(

		UDim2.new(0.151, 0,0.241, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	BackBlur.Enabled = true
	BackFrame.Visible = true
	BadgesButton.Visible = false
	MenuButton.Visible = false
	
end)

BackButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	BadgesFrame:TweenPosition(

		UDim2.new(1, 0,0, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	DescriptionFrame:TweenPosition(

		UDim2.new(0.151, 0,1, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	BackBlur.Enabled = false
	BackFrame.Visible = false
	wait(.25)
	BadgesButton.Visible = true
	MenuButton.Visible = true
	
end)

-- LocalScript (e.g., in StarterPlayerScripts)
local CheckBadgeEvents = ReplicatedStorage:WaitForChild("CheckBadgeEvents")
local CheckBadgeEvent1 = CheckBadgeEvents.CheckBadgeEvent1
local CheckBadgeEvent2 = CheckBadgeEvents.CheckBadgeEvent2
local CheckBadgeEvent3 = CheckBadgeEvents.CheckBadgeEvent3
local CheckBadgeEvent4 = CheckBadgeEvents.CheckBadgeEvent4
local CheckBadgeEvent5 = CheckBadgeEvents.CheckBadgeEvent5

CheckBadgeEvent1.OnClientEvent:Connect(function(hasBadge1)
	if hasBadge1 then
		hasBadge1 = true
		Badge1.ImageTransparency = 0
		
		Badge1.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://140149425581322"
			TitleText.Text = "First Visit"
			DescriptionText.Text = "Every story has it's beginning, and this will be yours"
			NotesText.Text = "Notes: Thank you for Joining us!!"
		end)
		
	elseif not hasBadge1 then
			Badge1.MouseButton1Click:Connect(function()
				UIClickSound()
				BadgePV.Image = "rbxassetid://78510150938447"
				TitleText.Text = "???"
				DescriptionText.Text = "Unlock this badge to see it's description"
				NotesText.Text = "Notes: Unlock this badge to see it's notes"
			end)
	end
end)

CheckBadgeEvent2.OnClientEvent:Connect(function(hasBadge2)
	if hasBadge2 then
		hasBadge2 = true
		Badge2.ImageTransparency = 0
		
		Badge2.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://72045485041951"
			TitleText.Text = "Beta Tester"
			DescriptionText.Text = "A humble beginning for both you (Player) and us (Developers)"
			NotesText.Text = "Notes: Thanks for Joining us on Beta Release!!"
		end)

	elseif not hasBadge2 then
		Badge2.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://78510150938447"
			TitleText.Text = "???"
			DescriptionText.Text = "Unlock this badge to see it's description"
			NotesText.Text = "Notes: Unlock this badge to see it's notes"
		end)
	end
end)

CheckBadgeEvent3.OnClientEvent:Connect(function(hasBadge3)
	if hasBadge3 then
		hasBadge3 = true
		Badge3.ImageTransparency = 0
		
		Badge3.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://120033457258210"
			TitleText.Text = "Master of Math"
			DescriptionText.Text = "It's a title befitting of your mastery in calculations!"
			NotesText.Text = "Notes: It feels like a key somehow..."
		end)

	elseif not hasBadge3 then
		Badge3.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://78510150938447"
			TitleText.Text = "???"
			DescriptionText.Text = "Unlock this badge to see it's description"
			NotesText.Text = "Notes: Unlock this badge to see it's notes"
		end)
	end
end)

CheckBadgeEvent4.OnClientEvent:Connect(function(hasBadge4)
	if hasBadge4 then
		hasBadge4 = true
		Badge4.ImageTransparency = 0
		
		Badge4.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://129967684073660"
			TitleText.Text = "Master of Informatics"
			DescriptionText.Text = "It's a title befitting of your mastery in logic and computations!"
			NotesText.Text = "Notes: -"
		end)

	elseif not hasBadge4 then
		Badge4.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://78510150938447"
			TitleText.Text = "???"
			DescriptionText.Text = "Unlock this badge to see it's description"
			NotesText.Text = "Notes: Unlock this badge to see it's notes"
		end)
	end
end)

CheckBadgeEvent5.OnClientEvent:Connect(function(hasBadge5)
	if hasBadge5 then
		hasBadge5 = true
		Badge5.ImageTransparency = 0
		
		Badge5.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://126183680154422"
			TitleText.Text = "How?!?"
			DescriptionText.Text = "Alright... I know you're bad. But, not this bad..."
			NotesText.Text = "Notes: Wow, somehow this is a key for something coming soon!"
		end)

	elseif not hasBadge5 then
		Badge5.MouseButton1Click:Connect(function()
			UIClickSound()
			BadgePV.Image = "rbxassetid://78510150938447"
			TitleText.Text = "???"
			DescriptionText.Text = "Unlock this badge to see it's description"
			NotesText.Text = "Notes: Unlock this badge to see it's notes"
		end)
	end
end)

-- Request the server to check the badge
CheckBadgeEvent1:FireServer(Badge1ID)
CheckBadgeEvent2:FireServer(Badge2ID)
CheckBadgeEvent3:FireServer(Badge3ID)
CheckBadgeEvent4:FireServer(Badge4ID)
CheckBadgeEvent5:FireServer(Badge5ID)
