local Players = game:GetService("Players")
local Menu = script.Parent

local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")

--LightControl
local Lighting = game:WaitForChild("Lighting")
local BackBlur = Lighting.BackBlur

--Sky
local Sky = ReplicatedStorage.Sky
local NightSky = nil

-- Var
local MenuButton = Menu.MainMenu.MenuButton
local MenuFrame = Menu.MainMenu.MainFrame
local BackFrame = Menu.MainMenu.BackFrame
local ModesActive = true
local SettingsActive = false
local CreditsActive = false
local BadgesButton = Menu.BadgesMenu.BadgesButton
local Chara = Menu.MainMenu.Chara

-- Sidebar Buttons 
local ButtonsFrame = MenuFrame.ButtonsFrame
local BackButton = ButtonsFrame.Back
local CreditsButton = ButtonsFrame.Credits
local ModesButton = ButtonsFrame.Modes
local SettingsButton = ButtonsFrame.Settings

-- Main
local Frames = MenuFrame.Frames

-- ModesFrames
local ModesFrame = Frames.ModesFrame
local MorningButton = ModesFrame.Morning.Morning
local DuskButton = ModesFrame.Dusk.Dusk
local NightButton = ModesFrame.Night.Night

local MorningIMG = MorningButton.ImageLabel
local DuskIMG = DuskButton.ImageLabel
local NightIMG = NightButton.ImageLabel

-- SettingsFrames
local SettingsFrame = Frames.SettingsFrame
local ShadowsButton = SettingsFrame.Frame1.Shadows.TextButton
local DiffuseButton = SettingsFrame.Frame1.Diffuse.TextButton

local MusicButton = SettingsFrame.Frame2.Music.TextButton
local MusicOn = SettingsFrame.Frame2.Music.MusicOn

local ShadowsActive = true
local ReflectionsActive = true
local DiffuseActive = true

-- CreditsFrames
local CreditsFrame = Frames.CreditsFrame

local AllDev1Frame = CreditsFrame.Frame1
local Dev1Frame = AllDev1Frame.DevFrame
local Dev1Name = Dev1Frame.DevName
local Role1Frame = AllDev1Frame.RoleFrame
local Dev1Role = Role1Frame.Role

local AllDev2Frame = CreditsFrame.Frame2
local Dev2Frame = AllDev2Frame.DevFrame
local Dev2Name = Dev2Frame.DevName
local Role2Frame = AllDev2Frame.RoleFrame
local Dev2Role = Role2Frame.Role

local AllDev3Frame = CreditsFrame.Frame3
local Dev3Frame = AllDev3Frame.DevFrame
local Dev3Name = Dev3Frame.DevName
local Role3Frame = AllDev3Frame.RoleFrame
local Dev3Role = Role3Frame.Role

local AllDev4Frame = CreditsFrame.Frame4
local Dev4Frame = AllDev4Frame.DevFrame
local Dev4Name = Dev4Frame.DevName
local Role4Frame = AllDev4Frame.RoleFrame
local Dev4Role = Role4Frame.Role

local Dev1UserID = 1987401460
local Dev2UserID = 1123269459
local Dev3UserID = 888286893
local Dev4UserID = 5472433446

Dev1Name.Text = "@"..game.Players:GetNameFromUserIdAsync(Dev1UserID)
Dev1Role.Text = "Lead Developer"

Dev2Name.Text = "@"..game.Players:GetNameFromUserIdAsync(Dev2UserID)
Dev2Role.Text = "Animator"

Dev3Name.Text = "@"..game.Players:GetNameFromUserIdAsync(Dev3UserID)
Dev3Role.Text = "Developer"

Dev4Name.Text = "@"..game.Players:GetNameFromUserIdAsync(Dev4UserID)
Dev4Role.Text = "Questionnaire"

--CasualSky
local CasualSky = Sky.CasualSky.Sky
local CasualAtmosphere = Sky.CasualSky.Atmosphere
local CasualBloom = Sky.CasualSky.Bloom
local CasualBlur = Sky.CasualSky.Blur
local CasualCC = Sky.CasualSky.ColorCorrection
local CasualDOF = Sky.CasualSky.DepthOfField
local CasualSunRays = Sky.CasualSky.SunRays

--CozySky
local CozySky = Sky.CozySky.Sky
local CozyAtmosphere = Sky.CozySky.Atmosphere
local CozyBloom = Sky.CozySky.Bloom
local CozyBlur = Sky.CozySky.Blur
local CozyCC = Sky.CozySky.ColorCorrection
local CozyDOF = Sky.CozySky.DepthOfField
local CozySunRays = Sky.CozySky.SunRays

--NightSky
local NightSky = Sky.NightSky.Sky
local NightAtmosphere = Sky.NightSky.Atmosphere
local NightBloom = Sky.NightSky.Bloom
local NightBlur = Sky.NightSky.Blur
local NightCC = Sky.NightSky.ColorCorrection
local NightDOF = Sky.NightSky.DepthOfField
local NightSunRays = Sky.NightSky.SunRays

--Info
local InfoGUI = script.Parent.Parent.Info
local InfoText = InfoGUI.TextLabel

--Sound
local SoundService = game:GetService("SoundService")
local UISound = SoundService.UIClick
local BGM = SoundService.Background
local StudyBGM = SoundService.StudyBGM

-- Functions
local function UIClickSound()
	if not UISound.IsPlaying then
		UISound:Play()
	end
end

MenuButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	MenuFrame:TweenPosition(
		
		UDim2.new(0.739, 0,0, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	Chara:TweenPosition(

		UDim2.new(0.042, 0,0.352, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	BackBlur.Enabled = true
	BackFrame.Visible = true
	MenuButton.Visible = false
	BadgesButton.Visible = false
	
end)

BackButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	MenuFrame:TweenPosition(

		UDim2.new(1, 0,0, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	Chara:TweenPosition(

		UDim2.new(0.042, 0,1, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.25
	)
	BackBlur.Enabled = false
	BackFrame.Visible = false
	wait(.25)
	MenuButton.Visible = true
	BadgesButton.Visible = true
	
end)

-- Modes
ModesButton.MouseEnter:Connect(function()
	if ModesActive == false then
		ModesButton:TweenPosition(

			UDim2.new(0.018, 0,0.148, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

ModesButton.MouseLeave:Connect(function()
	if ModesActive == false then
		ModesButton:TweenPosition(

			UDim2.new(0.776, 0,0.148, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

ModesButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	if SettingsActive == true then
		SettingsActive = false
		SettingsButton:TweenPosition(

			UDim2.new(0.776, 0,0.25, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)

	elseif CreditsActive == true then
		CreditsActive = false
		CreditsButton:TweenPosition(

			UDim2.new(0.776, 0,0.352, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)


	end

	ModesActive = true
	ModesFrame.Visible = true
	SettingsFrame.Visible = false
	CreditsFrame.Visible = false

end)

-- Settings
SettingsButton.MouseEnter:Connect(function()
	if SettingsActive == false then
		SettingsButton:TweenPosition(

			UDim2.new(0.018, 0,0.25, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

SettingsButton.MouseLeave:Connect(function()
	if SettingsActive == false then
		SettingsButton:TweenPosition(

			UDim2.new(0.776, 0,0.25, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

SettingsButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	if ModesActive == true then
		ModesActive = false
		ModesButton:TweenPosition(

			UDim2.new(0.776, 0,0.148, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
		
	elseif CreditsActive == true then
		CreditsActive = false
		CreditsButton:TweenPosition(

			UDim2.new(0.776, 0,0.352, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)

		
	end
	
	SettingsActive = true
	ModesFrame.Visible = false
	SettingsFrame.Visible = true
	CreditsFrame.Visible = false
	
end)

-- Credits
CreditsButton.MouseEnter:Connect(function()
	if CreditsActive == false then
		CreditsButton:TweenPosition(

			UDim2.new(0.018, 0,0.352, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

CreditsButton.MouseLeave:Connect(function()
	if CreditsActive == false then
		CreditsButton:TweenPosition(

			UDim2.new(0.776, 0,0.352, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)
	end
end)

CreditsButton.MouseButton1Click:Connect(function()
	
	UIClickSound()
	if ModesActive == true then
		ModesActive = false
		ModesButton:TweenPosition(

			UDim2.new(0.776, 0,0.148, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)

	elseif SettingsActive == true then
		SettingsActive = false
		SettingsButton:TweenPosition(

			UDim2.new(0.776, 0,0.25, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			.25
		)


	end

	CreditsActive = true
	ModesFrame.Visible = false
	SettingsFrame.Visible = false
	CreditsFrame.Visible = true

end)

MorningButton.MouseButton1Click:Connect(function()

	UIClickSound()

	--CloningVar
	local RCasualSky = CasualSky:Clone()
	local RCasualAtmosphere = CasualAtmosphere:Clone()
	local RCasualBloom = CasualBloom:Clone()
	local RCasualBlur = CasualBlur:Clone()
	local RCasualCC = CasualCC:Clone()
	local RCasualDOF = CasualDOF:Clone()
	local RCasualSunRays = CasualSunRays:Clone()

	--Lighting
	Lighting.Ambient = Color3.fromRGB(0,0,0) 
	Lighting.Brightness = 3.5
	Lighting.GeographicLatitude = -15.044
	Lighting.OutdoorAmbient = Color3.fromRGB(80, 72, 62)
	Lighting.FogColor = Color3.fromRGB(229, 227, 171)
	Lighting.ClockTime = 13

	--DestroyOldLighting
	Lighting.Atmosphere:Destroy()
	Lighting.Sky:Destroy()
	Lighting.Bloom:Destroy()
	Lighting.Blur:Destroy()
	Lighting.ColorCorrection:Destroy()
	Lighting.DepthOfField:Destroy()
	Lighting.SunRays:Destroy()

	--NewLighting
	RCasualSky.Parent = Lighting
	RCasualAtmosphere.Parent = Lighting
	RCasualBloom.Parent = Lighting
	RCasualBlur.Parent = Lighting
	RCasualCC.Parent = Lighting
	RCasualDOF.Parent = Lighting
	RCasualSunRays.Parent = Lighting

	--Info
	InfoText.TextColor3 = Color3.new(1, 1, 1)
	InfoText.Text = "Successfully changed mode to Morning"
	wait(1)
	InfoText.Text = ""

end)

DuskButton.MouseButton1Click:Connect(function()

	UIClickSound()

	--CloningVar
	local RCozySky = CozySky:Clone()
	local RCozyAtmosphere = CozyAtmosphere:Clone()
	local RCozyBloom = CozyBloom:Clone()
	local RCozyBlur = CozyBlur:Clone()
	local RCozyCC = CozyCC:Clone()
	local RCozyDOF = CozyDOF:Clone()
	local RCozySunRays = CozySunRays:Clone()

	--Lighting
	Lighting.Ambient = Color3.fromRGB(0,0,0)
	Lighting.Brightness = 3.5
	Lighting.GeographicLatitude = 64.741
	Lighting.OutdoorAmbient = Color3.fromRGB(80, 53, 40)
	Lighting.FogColor = Color3.fromRGB(229, 153, 76)
	Lighting.ClockTime = 17

	--DestroyOldLighting
	Lighting.Atmosphere:Destroy()
	Lighting.Sky:Destroy()
	Lighting.Bloom:Destroy()
	Lighting.Blur:Destroy()
	Lighting.ColorCorrection:Destroy()
	Lighting.DepthOfField:Destroy()
	Lighting.SunRays:Destroy()

	--NewLighting
	RCozySky.Parent = Lighting
	RCozyAtmosphere.Parent = Lighting
	RCozyBloom.Parent = Lighting
	RCozyBlur.Parent = Lighting
	RCozyCC.Parent = Lighting
	RCozyDOF.Parent = Lighting
	RCozySunRays.Parent = Lighting

	--Info
	InfoText.TextColor3 = Color3.new(1, 1, 1)
	InfoText.Text = "Successfully changed mode to Dusk"
	wait(1)
	InfoText.Text = ""

end)

NightButton.MouseButton1Click:Connect(function()

	UIClickSound()

	--CloningVar
	local RNightSky = NightSky:Clone()
	local RNightAtmosphere = NightAtmosphere:Clone()
	local RNightBloom = NightBloom:Clone()
	local RNightBlur = NightBlur:Clone()
	local RNightCC = NightCC:Clone()
	local RNightDOF = NightDOF:Clone()
	local RNightSunRays = NightSunRays:Clone()

	--Lighting
	Lighting.Ambient = Color3.fromRGB(0,0,0)
	Lighting.Brightness = 2
	Lighting.GeographicLatitude = 2.952
	Lighting.OutdoorAmbient = Color3.fromRGB(36, 34, 52)
	Lighting.FogColor = Color3.fromRGB(107, 117, 144)
	Lighting.ClockTime = 12

	--DestroyOldLighting
	Lighting.Atmosphere:Destroy()
	Lighting.Sky:Destroy()
	Lighting.Bloom:Destroy()
	Lighting.Blur:Destroy()
	Lighting.ColorCorrection:Destroy()
	Lighting.DepthOfField:Destroy()
	Lighting.SunRays:Destroy()

	--NewLighting
	RNightSky.Parent = Lighting
	RNightAtmosphere.Parent = Lighting
	RNightBloom.Parent = Lighting
	RNightBlur.Parent = Lighting
	RNightCC.Parent = Lighting
	RNightDOF.Parent = Lighting
	RNightSunRays.Parent = Lighting

	--Info
	InfoText.TextColor3 = Color3.new(1, 1, 1)
	InfoText.Text = "Successfully changed mode to Night"
	wait(1)
	InfoText.Text = ""
end)

-- SettingsButton
ShadowsButton.MouseButton1Click:Connect(function()
	UIClickSound()
	if ShadowsActive == true then
		ShadowsButton.Text = "Off"
		ShadowsButton.TextColor = BrickColor.new(1,1,1)
		ShadowsButton.BackgroundTransparency = 1
		Lighting.GlobalShadows = false
		ShadowsActive = false

	elseif ShadowsActive == false then
		ShadowsButton.Text = "On"
		ShadowsButton.TextColor = BrickColor.new(0,0,0)
		ShadowsButton.BackgroundTransparency = 0
		Lighting.GlobalShadows = true
		ShadowsActive = true

	end
end)

DiffuseButton.MouseButton1Click:Connect(function()
	UIClickSound()
	if DiffuseActive == true then
		DiffuseButton.Text = "Off"
		DiffuseButton.TextColor = BrickColor.new(1,1,1)
		DiffuseButton.BackgroundTransparency = 1
		Lighting.EnvironmentDiffuseScale = 0
		DiffuseActive = false

	elseif DiffuseActive == false then
		DiffuseButton.Text = "On"
		DiffuseButton.TextColor = BrickColor.new(0,0,0)
		DiffuseButton.BackgroundTransparency = 0
		Lighting.EnvironmentDiffuseScale = .15
		DiffuseActive = true

	end
end)

MusicButton.MouseButton1Click:Connect(function()
	UIClickSound()
	if MusicOn.Value == true then
		MusicButton.Text = "Off"
		MusicButton.TextColor = BrickColor.new(1,1,1)
		MusicButton.BackgroundTransparency = 1
		BGM.Volume = 0
		StudyBGM.Volume = 0
		MusicOn.Value = false

	elseif MusicOn.Value == false then
		MusicButton.Text = "On"
		MusicButton.TextColor = BrickColor.new(0,0,0)
		MusicButton.BackgroundTransparency = 0
		BGM.Volume = 0.2
		StudyBGM.Volume = 0.05
		MusicOn.Value = true

	end
end)

-- MouseEnter
MorningButton.MouseEnter:Connect(function()
	MorningIMG.ImageTransparency = 0.25
end)

DuskButton.MouseEnter:Connect(function()
	DuskIMG.ImageTransparency = 0.25
end)

NightButton.MouseEnter:Connect(function()
	NightIMG.ImageTransparency = 0.25
end)

-- MouseLeave
MorningButton.MouseLeave:Connect(function()
	MorningIMG.ImageTransparency = 0
end)

DuskButton.MouseLeave:Connect(function()
	DuskIMG.ImageTransparency = 0
end)

NightButton.MouseLeave:Connect(function()
	NightIMG.ImageTransparency = 0
end)
