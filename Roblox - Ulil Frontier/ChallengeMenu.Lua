-- Variables
local ChallengeMenu = script.Parent
local ChallengeFolder = game.Workspace:WaitForChild("ChallengeBook")
local Lighting = game:WaitForChild("Lighting")
local BackBlur = Lighting.BackBlur

-- Buttons
local BackButton = ChallengeMenu.Frame.BackButton
local PlayButton = ChallengeMenu.Frame.Description.ImageButton
local MenuButton = ChallengeMenu.Parent.MainMenu.MenuButton

local PlaceID = 81397121719336

-- PreviewMenu
local PVImage = ChallengeMenu.Frame.PVFrame.ImageLabel
local DescriptionFrame = ChallengeMenu.Frame.Description
local Title = DescriptionFrame.Title
local Creator = DescriptionFrame.Creator
local Description = DescriptionFrame.Description

--Sound
local SoundService = game:GetService("SoundService")
local UISound = SoundService.UIClick

local function UIClickSound()
	if not UISound.IsPlaying then
		UISound:Play()
	end
end

-- Challenges
local ChallengeBook01 = ChallengeFolder:WaitForChild("ChallengeBook01")
local Prompt01 = ChallengeBook01:WaitForChild("Prompt01")

-- HoverOver
PlayButton.MouseEnter:Connect(function()
	PlayButton.Transparency = 0.3
end)

PlayButton.MouseLeave:Connect(function()
	PlayButton.Transparency = 0
end)

-- BackButton
BackButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	
	ChallengeMenu.Visible = false
	MenuButton.Visible = true
	BackBlur.Enabled = false
	
end)

-- PromptTriggered
Prompt01.Triggered:Connect(function()
	
	UIClickSound()
	PlaceID = 81397121719336
	
	MenuButton.Visible = false
	ChallengeMenu.Visible = true
	BackBlur.Enabled = true
	
	Title.Text = "HelFlame"
	Creator.Text = "@CarzyCat146"
	Description.Text = "This Works Well!"
end)

-- PlayButtonTriggered
PlayButton.MouseButton1Click:Connect(function()
	UIClickSound()
	game:GetService("TeleportService"):Teleport(PlaceID)
end)
