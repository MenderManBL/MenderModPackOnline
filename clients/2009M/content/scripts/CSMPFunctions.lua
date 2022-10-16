settings().Rendering.FrameRateManager = 2
settings().Network.DataSendRate = 30
settings().Network.PhysicsSendRate = 20
settings().Network.ReceiveRate = 60
settings().Network.NetworkOwnerRate = 30
pcall(function() game:GetService("ScriptContext").ScriptsDisabled = false end)

--function made by rbxbanland
function newWaitForChild(newParent,name)
	local returnable = nil
	if newParent:FindFirstChild(name) then
		returnable = newParent:FindFirstChild(name)
	else 
		repeat wait() returnable = newParent:FindFirstChild(name)  until returnable ~= nil
	end
	return returnable
end

function KickPlayer(Player,reason)
	if (Player ~= nil) then
		local message = Instance.new("Message")
		message.Text = "You were kicked. Reason: "..reason
		message.Parent = Player
		wait(2)
		Player:remove()
		print("Player '" .. Player.Name .. "' with ID '" .. Player.userId .. "' kicked. Reason: "..reason)
	end
end

function newWaitForChildSecurity(newParent,name)
	local returnable = nil
	local loadAttempts = 0
	local maxAttempts = 5
	while loadAttempts < maxAttempts do
		if newParent:FindFirstChild(name) then
			returnable = newParent:FindFirstChild(name)
			break
		end
		wait()
		loadAttempts = loadAttempts + 1
		print("Player '" .. newParent.Name .. "' trying to connect. Number of attempts: "..loadAttempts)
	end
		
	if (loadAttempts == maxAttempts) then
		KickPlayer(newParent, "Modified Client")
	end
		
	return returnable
end

function LoadCharacterNew(playerApp,newChar)
	PlayerService = game:GetService("Players")
	Player = PlayerService:GetPlayerFromCharacter(newChar)
	
	wait(0.65)
	
	local function kick()
		KickPlayer(Player, "Modified Client")
	end
	
	if (playerApp == nil) then
		kick()
	end
	
	if (not Player:FindFirstChild("Appearance")) then
		kick()
	end
	
	if ((playerApp:GetChildren() == 0) or (playerApp:GetChildren() == nil)) then
		kick()
	end
	
	local path = "rbxasset://../../../shareddata/charcustom/"

	local charparts = {[1] = newWaitForChild(newChar,"Head"),[2] = newWaitForChild(newChar,"Torso"),[3] = newWaitForChild(newChar,"Left Arm"),[4] = newWaitForChild(newChar,"Right Arm"),[5] = newWaitForChild(newChar,"Left Leg"),[6] = newWaitForChild(newChar,"Right Leg")}
	for _,newVal in pairs(playerApp:GetChildren()) do
		local customtype = newVal.CustomizationType.Value
		if (customtype == 1) then 
			pcall(function() 
				charparts[newVal.ColorIndex.Value].BrickColor = newVal.Value 
			end)
		elseif (customtype == 2)  then
			pcall(function()
				local newHat = game.Workspace:InsertContent(path.."hats/"..newVal.Value)
				if newHat[1] then 
					if newHat[1].className == "Hat" then
						newHat[1].Parent = newChar
					else
						newHat[1]:remove()
					end
				end
			end)
		elseif (customtype == 3)  then
			pcall(function()
				local newTShirt = "";
				if (string.match(newVal.Value, "finobe") == "finobe") then
					newTShirt = Instance.new("ShirtGraphic")
					newTShirt.Graphic = newVal.Value
					newTShirt.Parent = newChar
				elseif (string.match(newVal.Value, "roblox") == "roblox") then
					newTShirt = game.Workspace:InsertContent(newVal.Value)
					if newTShirt[1] then 
						if newTShirt[1].className == "ShirtGraphic" then
							newTShirt[1].Parent = newChar
						else
							newTShirt[1]:remove()
						end
					end
				else
					newTShirt = game.Workspace:InsertContent(path.."tshirts/"..newVal.Value)
					if newTShirt[1] then 
						if newTShirt[1].className == "ShirtGraphic" then
							newTShirt[1].Parent = newChar
						else
							newTShirt[1]:remove()
						end
					end
				end
			end)
		elseif (customtype == 4)  then
			pcall(function()
				local newShirt = "";
				if (string.match(newVal.Value, "finobe") == "finobe") then
					newShirt = Instance.new("Shirt")
					newShirt.ShirtTemplate = newVal.Value
					newShirt.Parent = newChar
				elseif (string.match(newVal.Value, "roblox") == "roblox") then
					newShirt = game.Workspace:InsertContent(newVal.Value)
					if newShirt[1] then 
						if newShirt[1].className == "Shirt" then
							newShirt[1].Parent = newChar
						else
							newShirt[1]:remove()
						end
					end
				else
					newShirt = game.Workspace:InsertContent(path.."shirts/"..newVal.Value)
					if newShirt[1] then 
						if newShirt[1].className == "Shirt" then
							newShirt[1].Parent = newChar
						else
							newShirt[1]:remove()
						end
					end
				end
			end)
		elseif (customtype == 5)  then
			pcall(function()
				local newPants = "";
				if (string.match(newVal.Value, "finobe") == "finobe") then
					newPants = Instance.new("Pants")
					newPants.PantsTemplate = newVal.Value
					newPants.Parent = newChar
				elseif (string.match(newVal.Value, "roblox") == "roblox") then
					newPants = game.Workspace:InsertContent(newVal.Value)
					if newPants[1] then 
						if newPants[1].className == "Pants" then
							newPants[1].Parent = newChar
						else
							newPants[1]:remove()
						end
					end
				else
					newPants = game.Workspace:InsertContent(path.."pants/"..newVal.Value)
					if newPants[1] then 
						if newPants[1].className == "Pants" then
							newPants[1].Parent = newChar
						else
							newPants[1]:remove()
						end
					end
				end
			end)
		elseif (customtype == 6)  then
			pcall(function()
				local newFace = game.Workspace:InsertContent(path.."faces/"..newVal.Value)
				if newFace[1] then 
					if newFace[1].className == "Decal" then
						newWaitForChild(charparts[1],"face"):remove()
						newFace[1].Parent = charparts[1]
						newFace[1].Face = "Front"
					else
						newFace[1]:remove()
					end
				end
			end)
		elseif (customtype == 7)  then
			pcall(function()
				local newPart = game.Workspace:InsertContent(path.."heads/"..newVal.Value)
				if newPart[1] then 
					if newPart[1].className == "SpecialMesh" or newPart[1].className == "CylinderMesh" or newPart[1].className == "BlockMesh" then
						newWaitForChild(charparts[1],"Mesh"):remove()
						newPart[1].Parent = charparts[1]
					else
						newPart[1]:remove()
					end
				end
			end)
		elseif (customtype == 8)  then
			pcall(function()
				local newHat = game.Workspace:InsertContent(path.."hats/"..newVal.Value)
				if newHat[1] then 
					if newHat[1].className == "Hat" then
						newHat[1].Parent = newChar
					else
						newHat[1]:remove()
					end
				end
			end)
			
			pcall(function()
				local newItem = game.Workspace:InsertContent(path.."custom/"..newVal.Value)
				if newItem[1] then 
					if newItem[1].className == "Decal" then
						newWaitForChild(charparts[1],"face"):remove()
						newItem[1].Parent = charparts[1]
						newItem[1].Face = "Front"
					elseif newPart[1].className == "SpecialMesh" or newPart[1].className == "CylinderMesh" or newPart[1].className == "BlockMesh" then
						newWaitForChild(charparts[1],"Mesh"):remove()
						newItem[1].Parent = charparts[1]
					else
						newItem[1].Parent = newChar
					end
				end
			end)
		end
	end
end

function InitalizeClientAppearance(Player,Hat1ID,Hat2ID,Hat3ID,HeadColorID,TorsoColorID,LeftArmColorID,RightArmColorID,LeftLegColorID,RightLegColorID,TShirtID,ShirtID,PantsID,FaceID,HeadID,ItemID)
	local newCharApp = Instance.new("IntValue",Player)
	newCharApp.Name = "Appearance"
	--BODY COLORS
	for i=1,6,1 do
		local BodyColor = Instance.new("BrickColorValue",newCharApp)
		if (i == 1) then
			if (HeadColorID ~= nil) then
				BodyColor.Value = BrickColor.new(HeadColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Head Color"
		elseif (i == 2) then
			if (TorsoColorID ~= nil) then
				BodyColor.Value = BrickColor.new(TorsoColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Torso Color"
		elseif (i == 3) then
			if (LeftArmColorID ~= nil) then
				BodyColor.Value = BrickColor.new(LeftArmColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Left Arm Color"
		elseif (i == 4) then
			if (RightArmColorID ~= nil) then
				BodyColor.Value = BrickColor.new(RightArmColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Right Arm Color"
		elseif (i == 5) then
			if (LeftLegColorID ~= nil) then
				BodyColor.Value = BrickColor.new(LeftLegColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Left Leg Color"
		elseif (i == 6) then
			if (RightLegColorID ~= nil) then
				BodyColor.Value = BrickColor.new(RightLegColorID)
			else
				BodyColor.Value = BrickColor.new(1)
			end
			BodyColor.Name = "Right Leg Color"
		end
		local indexValue = Instance.new("NumberValue")
		indexValue.Name = "ColorIndex"
		indexValue.Parent = BodyColor
		indexValue.Value = i
		local typeValue = Instance.new("NumberValue")
		typeValue.Name = "CustomizationType"
		typeValue.Parent = BodyColor
		typeValue.Value = 1
	end
	--HATS
	for i=1,3,1 do
		local newHat = Instance.new("StringValue",newCharApp)
		if (i == 1) then
			if (Hat1ID ~= nil) then
				newHat.Value = Hat1ID
				newHat.Name = "Hat 1 - "..Hat1ID
			else
				newHat.Value = "NoHat.rbxm"
				newHat.Name = "Hat 1 - NoHat.rbxm"
			end
		elseif (i == 2) then
			if (Hat2ID ~= nil) then
				newHat.Value = Hat2ID
				newHat.Name = "Hat 2 - "..Hat2ID
			else
				newHat.Value = "NoHat.rbxm"
				newHat.Name = "Hat 2 - NoHat.rbxm"
			end
		elseif (i == 3) then
			if (Hat3ID ~= nil) then
				newHat.Value = Hat3ID
				newHat.Name = "Hat 3 - "..Hat3ID
			else
				newHat.Value = "NoHat.rbxm"
				newHat.Name = "Hat 3 - NoHat.rbxm"
			end
		end
		local typeValue = Instance.new("NumberValue")
		typeValue.Name = "CustomizationType"
		typeValue.Parent = newHat
		typeValue.Value = 2
	end
	--T-SHIRT
	local newTShirt = Instance.new("StringValue",newCharApp)
	if (TShirtID ~= nil) then
		newTShirt.Value = TShirtID
		newTShirt.Name = "T-Shirt - "..TShirtID
	else
		newTShirt.Value = "NoTShirt.rbxm"
		newTShirt.Name = "T-Shirt - NoTShirt.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newTShirt
	typeValue.Value = 3
	--SHIRT
	local newShirt = Instance.new("StringValue",newCharApp)
	if (ShirtID ~= nil) then
		newShirt.Value = ShirtID
		newShirt.Name = "Shirt - "..ShirtID
	else
		newShirt.Value = "NoShirt.rbxm"
		newShirt.Name = "Shirt - NoShirt.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newShirt
	typeValue.Value = 4
	--PANTS
	local newPants = Instance.new("StringValue",newCharApp)
	if (PantsID ~= nil) then
		newPants.Value = PantsID
		newPants.Name = "Pants - "..PantsID
	else
		newPants.Value = "NoPants.rbxm"
		newPants.Name = "Pants - NoPants.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newPants
	typeValue.Value = 5
	--FACE
	local newFace = Instance.new("StringValue",newCharApp)
	if (FaceID ~= nil) then
		newFace.Value = FaceID
		newFace.Name = "Face - "..FaceID
	else
		newFace.Value = "DefaultFace.rbxm"
		newFace.Name = "Face - DefaultFace.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newFace
	typeValue.Value = 6
	--HEADS
	local newHead = Instance.new("StringValue",newCharApp)
	if (HeadID ~= nil) then
		newHead.Value = HeadID
		newHead.Name = "Head - "..HeadID
	else
		newHead.Value = "DefaultHead.rbxm"
		newHead.Name = "Head - DefaultHead.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newHead
	typeValue.Value = 7
	--EXTRA
	local newItem = Instance.new("StringValue",newCharApp)
	if (ItemID ~= nil) then
		newItem.Value = ItemID
		newItem.Name = "Extra - "..ItemID
	else
		newItem.Value = "NoExtra.rbxm"
		newItem.Name = "Extra - NoExtra.rbxm"
	end
	local typeValue = Instance.new("NumberValue")
	typeValue.Name = "CustomizationType"
	typeValue.Parent = newItem
	typeValue.Value = 8
end

function LoadSecurity(playerApp,Player,ServerSecurityLocation)
	local function kick()
		KickPlayer(Player, "Modified Client")
	end
	
	if (playerApp == nil) then
		kick()
	end
	
	if (not Player:FindFirstChild("Security")) then
		kick()
	end
	
	if (not playerApp:FindFirstChild("ClientEXEMD5") or not playerApp:FindFirstChild("LauncherMD5") or not playerApp:FindFirstChild("ClientScriptMD5")) then
		kick()
	end
	
	for _,newVal in pairs(playerApp:GetChildren()) do
		if (newVal.Name == "ClientEXEMD5") then
			if (newVal.Value ~= ServerSecurityLocation.Security.ClientEXEMD5.Value or newVal.Value == "") then
				kick()
				break
			end
		end
				
		if (newVal.Name == "LauncherMD5") then
			if (newVal.Value ~= ServerSecurityLocation.Security.LauncherMD5.Value or newVal.Value == "") then
				kick()
				break
			end
		end
				
		if (newVal.Name == "ClientScriptMD5") then
			if (newVal.Value ~= ServerSecurityLocation.Security.ClientScriptMD5.Value or newVal.Value == "") then
				kick()
				break
			end
		end
	end
end

function InitalizeSecurityValues(Location,ClientEXEMD5,LauncherMD5,ClientScriptMD5)
	Location = Instance.new("IntValue", Location)
	Location.Name = "Security"
	
	local clientValue = Instance.new("StringValue", Location)
	clientValue.Value = ClientEXEMD5 or ""
	clientValue.Name = "ClientEXEMD5"

	local launcherValue = Instance.new("StringValue", Location)
	launcherValue.Value = LauncherMD5 or ""
	launcherValue.Name = "LauncherMD5"

	local scriptValue = Instance.new("StringValue", Location)
	scriptValue.Value = ClientScriptMD5 or ""
	scriptValue.Name = "ClientScriptMD5"
end

function InitalizeTripcode(Location,Tripcode)
	local code = Instance.new("StringValue", Location)
	code.Value = Tripcode or ""
	code.Name = "Tripcode"
end

function LoadTripcode(Player)
	local function kick()
		KickPlayer(Player, "Modified Client")
	end
	
	if (not Player:FindFirstChild("Tripcode")) then
		kick()
	end
	
	for _,newVal in pairs(Player:GetChildren()) do
		if (newVal.Name == "Tripcode") then
			if (newVal.Value == "") then
				kick()
				break
			end
		end
	end
end

rbxversion = version()
print("ROBLOX Client version '" .. rbxversion .. "' loaded.")

function CSServer(Port,PlayerLimit,ClientEXEMD5,LauncherMD5,ClientScriptMD5)
	pcall(function() dofile("rbxasset://..//..//..//addons//core//AddonLoader.lua") end)
	pcall(function() _G.CSScript_PreInit("Server", "2009M") end)
	assert((type(Port)~="number" or tonumber(Port)~=nil or Port==nil),"CSRun Error: Port must be nil or a number.")
	local NetworkServer=game:GetService("NetworkServer")
	local RunService = game:GetService("RunService")
	local PlayerService = game:GetService("Players")
	pcall(NetworkServer.Stop,NetworkServer)
	NetworkServer:Start(Port)
	PlayerService.MaxPlayers = PlayerLimit
	PlayerService.PlayerAdded:connect(function(Player)
		if (PlayerService.NumPlayers > PlayerService.MaxPlayers) then
			KickPlayer(Player, "Too many players on server.")
		else
			print("Player '" .. Player.Name .. "' with ID '" .. Player.userId .. "' added")
			Player:LoadCharacter()
		end
		
		Player.CharacterAdded:connect(function(char)
			LoadSecurity(newWaitForChildSecurity(Player,"Security"),Player,game.Lighting)
			newWaitForChildSecurity(Player,"Tripcode")
			LoadTripcode(Player)
			pcall(function() print("Player '" .. Player.Name .. "-" .. Player.userId .. "' security check success. Tripcode: '" .. Player.Tripcode.Value .. "'") end)
			if (char ~= nil) then
				LoadCharacterNew(newWaitForChildSecurity(Player,"Appearance"),char)
			end
			
			-- rename all Server replicators in NetworkServer to "ServerReplicator"
			for _,Child in pairs(NetworkServer:GetChildren()) do
				Child.Name = "ServerReplicator"
			end
		end)
		
		Player.Changed:connect(function(Property)
			if (Property=="Character") and (Player.Character~=nil) then
				local Character=Player.Character
				local Humanoid=Character:FindFirstChild("Humanoid")
				if (Humanoid~=nil) then
					Humanoid.Died:connect(function() delay(5,function() Player:LoadCharacter() LoadCharacterNew(newWaitForChildSecurity(Player,"Appearance"),Player.Character) end) end)
				end
			end
		end)
		
		Player.Chatted:connect(function(msg)
			print(Player.Name.."; "..msg)
		end)
	end)
	PlayerService.PlayerRemoving:connect(function(Player)
		print("Player '" .. Player.Name .. "' with ID '" .. Player.userId .. "' leaving")	
	end)
	RunService:Run()
	game.Workspace:InsertContent("rbxasset://Fonts//libraries.rbxm")
	InitalizeSecurityValues(game.Lighting,ClientEXEMD5,LauncherMD5,ClientScriptMD5)
	pcall(function() game.Close:connect(function() NetworkServer:Stop() end) end)
	NetworkServer.IncommingConnection:connect(IncommingConnection)
end

function CSConnect(UserID,ServerIP,ServerPort,PlayerName,Hat1ID,Hat2ID,Hat3ID,HeadColorID,TorsoColorID,LeftArmColorID,RightArmColorID,LeftLegColorID,RightLegColorID,TShirtID,ShirtID,PantsID,FaceID,HeadID,IconType,ItemID,ClientEXEMD5,LauncherMD5,ClientScriptMD5,Tripcode,Ticket)
	pcall(function() game:SetPlaceID(-1, false) end)
	pcall(function() game:GetService("Players"):SetChatStyle(Enum.ChatStyle.ClassicAndBubble) end)

	pcall(function()
		game:GetService("GuiService").Changed:connect(function()
			pcall(function() game:GetService("GuiService").ShowLegacyPlayerList=true end)
			pcall(function() game.CoreGui.RobloxGui.PlayerListScript:Remove() end)
			pcall(function() game.CoreGui.RobloxGui.PlayerListTopRightFrame:Remove() end)
			pcall(function() game.CoreGui.RobloxGui.BigPlayerListWindowImposter:Remove() end)
			pcall(function() game.CoreGui.RobloxGui.BigPlayerlist:Remove() end)
		end)
	end)
	game:GetService("RunService"):Run()
	assert((ServerIP~=nil and ServerPort~=nil),"CSConnect Error: ServerIP and ServerPort must be defined.")
	local function SetMessage(Message) game:SetMessage(Message) end
	local Visit,NetworkClient,PlayerSuccess,Player,ConnectionFailedHook=game:GetService("Visit"),game:GetService("NetworkClient")

	local function GetClassCount(Class,Parent)
		local Objects=Parent:GetChildren()
		local Number=0
		for Index,Object in pairs(Objects) do
			if (Object.className==Class) then
				Number=Number+1
			end
			Number=Number+GetClassCount(Class,Object)
		end
		return Number
	end

	local function RequestCharacter(Replicator)
		local Connection
		Connection=Player.Changed:connect(function(Property)
			if (Property=="Character") then
				game:ClearMessage()
			end
		end)
		SetMessage("Requesting character...")
		Replicator:RequestCharacter()
		SetMessage("Waiting for character...")
	end

	local function Disconnection(Peer,LostConnection)
		SetMessage("You have lost connection to the game")
	end

	local function ConnectionAccepted(Peer,Replicator)
		Replicator.Disconnection:connect(Disconnection)
		local RequestingMarker=true
		game:SetMessageBrickCount()
		local Marker=Replicator:SendMarker()
		Marker.Received:connect(function()
			RequestingMarker=false
			RequestCharacter(Replicator)
		end)
		while RequestingMarker do
			Workspace:ZoomToExtents()
			wait(0.5)
		end
	end

	local function ConnectionFailed(Peer, Code, why)
		SetMessage("Failed to connect to the Game. (ID="..Code.." ["..why.."])")
	end

	pcall(function() settings().Diagnostics:LegacyScriptMode() end)
	pcall(function() game:SetRemoteBuildMode(true) end)
	SetMessage("Connecting to server...")
	NetworkClient.ConnectionAccepted:connect(ConnectionAccepted)
	ConnectionFailedHook=NetworkClient.ConnectionFailed:connect(ConnectionFailed)
	NetworkClient.ConnectionRejected:connect(function()
		pcall(function() ConnectionFailedHook:disconnect() end)
		SetMessage("Failed to connect to the Game. (Connection rejected)")
	end)

	pcall(function() NetworkClient.Ticket=Ticket or "" end) -- 2008 client has no ticket :O
	PlayerSuccess,Player=pcall(function() return NetworkClient:PlayerConnect(UserID,ServerIP,ServerPort) end)

	if (not PlayerSuccess) then
		SetMessage("Failed to connect to the Game. (Invalid IP Address)")
		NetworkClient:Disconnect()
	end

	if (not PlayerSuccess) then
		local Error,Message=pcall(function()
			Player=game:GetService("Players"):CreateLocalPlayer(UserID)
			NetworkClient:Connect(ServerIP,ServerPort)
		end)
		if (not Error) then
			SetMessage("Failed to connect to the Game.")
		end
	end
	
	pcall(function() Player.Name=PlayerName or "" end)
	InitalizeSecurityValues(Player,ClientEXEMD5,LauncherMD5,ClientScriptMD5)
	InitalizeClientAppearance(Player,Hat1ID,Hat2ID,Hat3ID,HeadColorID,TorsoColorID,LeftArmColorID,RightArmColorID,LeftLegColorID,RightLegColorID,TShirtID,ShirtID,PantsID,FaceID,HeadID,ItemID)
	InitalizeTripcode(Player,Tripcode)
	pcall(function() Player:SetUnder13(false) end)
	pcall(function() Player:SetMembershipType(Enum.MembershipType.BuildersClub) end)
	pcall(function() Player:SetAccountAge(365) end)
	Player:SetSuperSafeChat(false)
	Player.CharacterAppearance=0
	game.GuiRoot.MainMenu["Tools"]:Remove()
	game.GuiRoot.MainMenu["Insert"]:Remove()
	pcall(function() Visit:SetUploadUrl("") end)
	game:GetService("Visit")
end

function CSSolo(UserID,PlayerName,Hat1ID,Hat2ID,Hat3ID,HeadColorID,TorsoColorID,LeftArmColorID,RightArmColorID,LeftLegColorID,RightLegColorID,TShirtID,ShirtID,PantsID,FaceID,HeadID,IconType,ItemID)
	pcall(function() dofile("rbxasset://..//..//..//addons//core//AddonLoader.lua") end)
	pcall(function() _G.CSScript_PreInit("Solo", "2009M") end)
	local plr = game.Players:CreateLocalPlayer(UserID)
	game:GetService("RunService"):Run()
	game.Workspace:InsertContent("rbxasset://Fonts//libraries.rbxm")
	plr.Name = PlayerName
	plr:LoadCharacter()
	plr.CharacterAppearance=0
	InitalizeClientAppearance(plr,Hat1ID,Hat2ID,Hat3ID,HeadColorID,TorsoColorID,LeftArmColorID,RightArmColorID,LeftLegColorID,RightLegColorID,TShirtID,ShirtID,PantsID,FaceID,HeadID,ItemID)
	LoadCharacterNew(newWaitForChild(plr,"Appearance"),plr.Character,false)
	game:GetService("Visit")
	while true do wait()
		if (plr.Character.Humanoid.Health == 0) then
			wait(5)
			plr:LoadCharacter()
			LoadCharacterNew(newWaitForChild(plr,"Appearance"),plr.Character,false)
		end
	end
end

function CSStudio()
end

_G.CSServer=CSServer
_G.CSConnect=CSConnect
_G.CSSolo=CSSolo
_G.CSStudio=CSStudio