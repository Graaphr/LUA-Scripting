local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local camera = workspace.CurrentCamera

local WalkAnim = character:WaitForChild("Animate"):WaitForChild("walk").WalkAnim
WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=89526900009961" -- YourAssetID

-- ===== CONFIG =====
local normalSpeed = 14
local sprintSpeed = 30
local normalFOV = 70
local sprintFOV = 85
local tweenTime = 0.25 -- Transition time

local sprintAnimId = "rbxassetid://109194049779889" -- ID animation

-- ===== INTERNAL =====
local sprintAnim = Instance.new("Animation")
sprintAnim.AnimationId = sprintAnimId
local sprintAnimTrack

local isSprinting = false
local isMoving = false

local function getSprintAnimSpeed()
	return humanoid.WalkSpeed - 28.5
end

-- Check if its okay to play sprint anim
local function canPlaySprintAnim()
	local state = humanoid:GetState()
	return state ~= Enum.HumanoidStateType.Swimming 
		and state ~= Enum.HumanoidStateType.Seated 
		and state ~= Enum.HumanoidStateType.Freefall
end

local function startSprint()
	isSprinting = true
	humanoid.WalkSpeed = sprintSpeed
	TweenService:Create(camera, TweenInfo.new(tweenTime), {FieldOfView = sprintFOV}):Play()

	if not sprintAnimTrack then
		sprintAnimTrack = humanoid:LoadAnimation(sprintAnim)
	end

	if isMoving and canPlaySprintAnim() then
		sprintAnimTrack:AdjustSpeed(getSprintAnimSpeed())
		sprintAnimTrack:Play()
	end
	print("Sprint ON")
end

local function stopSprint()
	isSprinting = false
	humanoid.WalkSpeed = normalSpeed
	TweenService:Create(camera, TweenInfo.new(tweenTime), {FieldOfView = normalFOV}):Play()
	if sprintAnimTrack and sprintAnimTrack.IsPlaying then
		sprintAnimTrack:Stop()
	end
	print("Sprint OFF")
end

-- Update animation when running
humanoid.Running:Connect(function(speed)
	isMoving = speed > 0
	if isMoving then
		if isSprinting and canPlaySprintAnim() then
			if sprintAnimTrack and not sprintAnimTrack.IsPlaying then
				sprintAnimTrack:AdjustSpeed(getSprintAnimSpeed())
				sprintAnimTrack:Play()
			elseif sprintAnimTrack and sprintAnimTrack.IsPlaying then
				sprintAnimTrack:AdjustSpeed(getSprintAnimSpeed())
			end
		else
			if sprintAnimTrack and sprintAnimTrack.IsPlaying then
				sprintAnimTrack:Stop()
			end
		end
	else
		if sprintAnimTrack and sprintAnimTrack.IsPlaying then
			sprintAnimTrack:Stop()
		end
	end
end)
-- Detect if there's an actin that can stop the running state
humanoid.StateChanged:Connect(function(_, newState)
	if not canPlaySprintAnim() then
		if sprintAnimTrack and sprintAnimTrack.IsPlaying then
			sprintAnimTrack:Stop()
		end
	end
end)

local function handler(actionName, inputState)
	if actionName == "Sprint" then
		if inputState == Enum.UserInputState.Begin then
			if isSprinting then
				stopSprint()
			else
				startSprint()
			end
		end
	end
end

ContextActionService:BindAction("Sprint", handler, true, Enum.KeyCode.LeftShift, Enum.KeyCode.ButtonL1)
ContextActionService:SetPosition("Sprint", UDim2.fromScale(0.5, 0.2))
ContextActionService:SetTitle("Sprint", "Sprint")

-- Reset at spawn
player.CharacterAdded:Connect(function(newChar)
	character = newChar
	humanoid = character:WaitForChild("Humanoid")
	isSprinting = false
	isMoving = false
	sprintAnimTrack = nil
	humanoid.WalkSpeed = normalSpeed
	camera.FieldOfView = normalFOV
end)

-- Initial setup
humanoid.WalkSpeed = normalSpeed
camera.FieldOfView = normalFOV


