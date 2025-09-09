local ProximityPromptService = game:GetService("ProximityPromptService")
local Player = game:GetService("Players")

local highlightlookupdictionary = {}

ProximityPromptService.PromptShown:Connect(function(promptInstance)
	if promptInstance:HasTag("CanHighLight") then
		if not  highlightlookupdictionary[promptInstance] then
			local highlightAdornee = promptInstance:FindFirstAncestorWhichIsA("BasePart") or promptInstance:FindFirstAncestorOfClass("Model")


			local newHighLight = Instance.new("Highlight")
			newHighLight.FillTransparency = 0.8
			newHighLight.FillColor = Color3.fromRGB(255, 255, 255)
			newHighLight.DepthMode = Enum.HighlightDepthMode.Occluded
			newHighLight.Adornee = highlightAdornee
			newHighLight.Parent = Player.LocalPlayer:WaitForChild("PlayerGui")

			highlightlookupdictionary[promptInstance] = newHighLight
		end
	end
end)

ProximityPromptService.PromptHidden:Connect(function(promptInstance)
	local proximitypromptHighlight = highlightlookupdictionary[promptInstance]
	if proximitypromptHighlight then
		highlightlookupdictionary[promptInstance] = nil
		proximitypromptHighlight:Destroy()
	end
end)
