-- Variables
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")
local Player = game:GetService("Players").LocalPlayer
local StarterGUI = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")

task.wait(2)
StarterGUI:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
StarterGUI:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
StarterGUI:SetCore("ResetButtonCallback", false)

-- PlayersSettings
local plr = game.Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local Humanoid = Char:WaitForChild("Humanoid")
Humanoid.WalkSpeed = 0
Char:WaitForChild("HumanoidRootPart"):WaitForChild("Running").Volume = 0.08

--Sounds/Music
local Chirps = SoundService.Chirps
local BGM = SoundService.Background
local Notification = SoundService.Notification
local Whoosh = SoundService.Whoosh
local SysNotification = SoundService.SystemNotif
local LoadingBGM = SoundService.LoadingBGM

-- LoadingScreen
local Main = script.Parent:WaitForChild("Main")
local Holder = Main:WaitForChild("Holder")
local LoadingScreen = script.Parent
local Skip = LoadingScreen.Main.TextButton
local skipped = false



Skip.MouseEnter:Connect(function()
	Skip.TextColor3 = Color3.fromRGB(255,255,255)
	Skip.BackgroundColor3 = Color3.fromRGB(254, 136, 0)
end)

Skip.MouseLeave:Connect(function()
	Skip.TextColor3 = Color3.fromRGB(254, 136, 0)
	Skip.BackgroundColor3 = Color3.fromRGB(255,255,255)
end)

Skip.MouseButton1Click:Connect(function()
	skipped = true
	LoadingScreen.Enabled = false
end)

ReplicatedFirst:RemoveDefaultLoadingScreen()

local Assets = game:GetDescendants()

-- LoadingScreen/BGImage
local id = {"rbxassetid://123940105550139",
	"rbxassetid://119239137765018",
	"rbxassetid://97704894077511",
	"rbxassetid://105878591661030",
	"rbxassetid://71860359527697",
	"rbxassetid://124723835904605",
	"rbxassetid://123754196511248",
	"rbxassetid://109257582040979",
	"rbxassetid://71579782343573",
	"rbxassetid://112750970688381",
	"rbxassetid://108650792214741",
	"rbxassetid://115395670843665",
	"rbxassetid://115395670843665",
	"rbxassetid://75710528514435"
	
	
	
	
	}
local Background = Main.Background
Background.Image = id[math.random(1,#id)]

LoadingScreen.Enabled = true

-- SplashScreen
local SplashScreen = script.Parent.Parent.SplashScreen
local SplashFrame = SplashScreen.Frame
local LogoUA = SplashScreen.Frame.LogoUA
local LogoOuroboros = SplashScreen.Frame.LogoOuroboros

local Camera = SplashScreen.Camera
local Top = Camera.Top
local Bottom = Camera.Bottom

SplashScreen.Enabled = true

-- Menus
local Menu = script.Parent.Parent.Menu
local MainMenu = Menu.MainMenu
local BadgesMenu = Menu.BadgesMenu
local NoticeMenu = Menu.NoticeMenu

LoadingBGM:Play()

-- CutsceneLoader

local currentCamera = workspace.CurrentCamera
local folder = workspace:WaitForChild("Cutscene")

function OpenCam()
	Top:TweenSize(

		UDim2.new(1, 0,0.102, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		2
	)
	Bottom:TweenSize(

		UDim2.new(1, 0,0.102, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		2
	)
	Bottom:TweenPosition(
		UDim2.new(0, 0,0.8978, 0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		2
	)
end

function KillCam()
	Top:TweenPosition(
		UDim2.new(0,0,-0.1,0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.5
	)
	Bottom:TweenPosition(
		UDim2.new(0,0,1,0),
		Enum.EasingDirection.InOut,
		Enum.EasingStyle.Quad,
		.5
	)
end

local function cueCutsceneCam(speed)
	OpenCam()
	local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

	currentCamera.CameraType = Enum.CameraType.Scriptable
	currentCamera.CFrame = folder[1].CFrame

	for i = 2, #folder:GetChildren() do
		if folder:FindFirstChild(i.."S") then
			currentCamera.CFrame = folder[i.."S"].CFrame
		else
			TweenService:Create(currentCamera, tweeninfo, {CFrame = folder[i].CFrame}):Play()
			wait(tweeninfo.Time)
		end
	end

	currentCamera.CameraType = Enum.CameraType.Custom
end

for i = 1, #Assets do
	if not skipped then
		local Asset = Assets[i]
		local Percentage = math.round(i/#Assets * 100)

		ContentProvider:PreloadAsync({Asset})

		Holder.AssetsLoaded.Text = "Loading Assets ["..i.."/"..#Assets.."]"

		TweenService:Create(Holder.Bar, TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.fromScale(Percentage/100, 1)}):Play()

		if i % 5 == 0 then
			wait()
		end

		if i == #Assets then
			wait(1)
		end
	else
		break
	end
end

local OutTI = TweenInfo.new(1, Enum.EasingStyle.Quint)

TweenService:Create(Main, OutTI, {BackgroundTransparency = 1}):Play()

for i, ui in pairs(Main:GetChildren()) do
	if not skipped then
		if ui.ClassName == "Frame" then
			TweenService:Create(ui, OutTI, {BackgroundTransparency = 1}):Play()
			TweenService:Create(ui.Bar, OutTI, {BackgroundTransparency = 1}):Play()
			TweenService:Create(ui.AssetsLoaded, OutTI, {TextTransparency = 1}):Play()

		elseif ui.ClassName == "TextLabel" then
			TweenService:Create(ui, OutTI, {TextTransparency = 1}):Play()
		elseif ui.ClassName == "ImageLabel" then
			TweenService:Create(ui, OutTI, {ImageTransparency = 1}):Play()
		end

		if ui:FindFirstChildWhichIsA("UIStroke") then
			local Stroke = ui:FindFirstChildWhichIsA("UIStroke")

			TweenService:Create(Stroke, OutTI, {Transparency = 1}):Play()
		end
	else
		break
	end
end



-- SplashScreenLoader
Skip.Visible = false
LoadingBGM:Stop()
wait(1.5)

SysNotification:Play()
for i=0, 10, 1 do
	LogoUA.ImageTransparency -= 0.1
	wait(0.01)
end
wait(2)
for i=0, 10, 1 do
	LogoUA.ImageTransparency += 0.1
	wait(0.01)
end

wait(1)

SysNotification:Play()
for i=0, 10, 1 do
	LogoOuroboros.ImageTransparency -= 0.1
	wait(0.01)
end
wait(2)
Camera.Visible = true
for i=0, 10, 1 do
	LogoOuroboros.ImageTransparency += 0.1
	SplashFrame.Transparency += 0.1
	wait(0.01)
end

Chirps:Play()
BGM:Play()

cueCutsceneCam(5)
UserInputService.MouseIconEnabled = true
BGM.Volume = 0.05
Humanoid.WalkSpeed = 16

-- AfterSplashLoader
MainMenu.Visible = true
BadgesMenu.Visible = true
KillCam()

wait(.2)

StarterGUI:SetCore("ResetButtonCallback", true)



