-- LocalScript (put this in StarterPlayerScripts)

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")

-- Gradient of colors to shift between
local colors = {
    Color3.fromRGB(0, 255, 255), -- Cyan
    Color3.fromRGB(0, 128, 255), -- Blue
    Color3.fromRGB(128, 0, 255), -- Purple
    Color3.fromRGB(0, 255, 128)  -- Aqua-green
}

-- Optional: put all crystal parts in a Folder called "Crystals"
local crystalFolder = workspace:FindFirstChild("Crystals")

-- Collect crystals
local crystals = {}
if crystalFolder then
    for _, part in pairs(crystalFolder:GetDescendants()) do
        if part:IsA("BasePart") then
            table.insert(crystals, part)
        end
    end
else
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Material == Enum.Material.Neon then
            table.insert(crystals, part)
        end
    end
end

-- Smooth interpolation helper
local function smoothLerp(a, b, t)
    return a + (b - a) * math.clamp(t, 0, 1)
end

runService.RenderStepped:Connect(function()
    local camPos = camera.CFrame.Position

    for _, crystal in ipairs(crystals) do
        if crystal and crystal:IsA("BasePart") then
            -- Direction from camera to crystal
            local dir = (crystal.Position - camPos).Unit

            -- Compare viewing direction with crystal forward axis (Z axis here)
            local dot = dir:Dot(Vector3.new(0, 0, 1))

            -- Map dot (-1..1) → 0..1
            local t = (dot + 1) / 2

            -- Figure out which two colors to blend
            local index = math.floor(t * (#colors - 1)) + 1
            local nextIndex = math.min(index + 1, #colors)
            local alpha = (t * (#colors - 1)) % 1

            -- Blend smoothly
            local targetColor = colors[index]:Lerp(colors[nextIndex], alpha)

            -- Interpolate current color toward target (prevents snapping)
            crystal.Color = crystal.Color:Lerp(targetColor, 0.1)

            -- Vibrant ice look
            crystal.Material = Enum.Material.Neon
            crystal.Transparency = 0.2
        end
    end
end)
