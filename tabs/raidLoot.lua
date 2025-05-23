local addonName = ...
local _ = LibStub("LibLodash-1"):Get()
local L, _ = GreatVaultList:GetLibs()


local TabID = "raidLoot"
local Tab = GreatVaultList:NewModule(TabID, GREATVAULTLIST_TABS)

Tab.id = TabID
Tab.name = string.format(L["tabLoot_name"], RAIDS)
Tab.template = "GreatVaultListRaidLootTemplate"


GreatVaultListRaidLootListMixin  = CreateFromMixins(GreatVaultListLootListMixin);

GreatVaultListRaidLootListMixin.id = TabID
GreatVaultListRaidLootListMixin.tabName = Tab.name
GreatVaultListRaidLootListMixin.sortOrder = 5


function GreatVaultListRaidLootListMixin:OnLoad()
	GreatVaultListLootListMixin.OnLoad(self)
	-- GreatVaultList.ElvUi:AddTab(self)
end

function GreatVaultListRaidLootListMixin:GetHelpConfig()

	local width = self:GetWidth()
	local height = self:GetHeight() + 50



	local helpConfig = {
		FramePos = { x = 0, y = 0 },
		FrameSize = { width = width, height = height },
		[1] = { ButtonPos = { position = "CENTER" }, HighLightBox = { x = 5, y = -40, width = width + 10 , height = height - 40 - 5 - 50 },  ToolTipDir = "RIGHT",   ToolTipText = L["HELP_Loot_table"] },
	}

	return helpConfig
end

function GreatVaultListRaidLootListMixin:BuildData()



	self:AddColumn(L["raidLoot_col1"])
	self:AddColumn(string.format(L["raidLoot_bosses"], "1-2"), true)
	self:AddColumn(string.format(L["raidLoot_bosses"], "3-4"), true)
	self:AddColumn(string.format(L["raidLoot_bosses"], "5-6"), true)
	self:AddColumn(string.format(L["raidLoot_bosses"], "7-8"), true)

	self.ItemList.data = {
		{
			string.format("%s %s", "LFR", L["raidLoot_Regular"]),
			623,
			626,
			629,
			632
		},
		{
			string.format("%s %s", "LFR", L["raidLoot_VeryRare"]),
			nil,
			639,
			639,
			639
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY1, L["raidLoot_Regular"]),
			636,
			639,
			642,
			645
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY1, L["raidLoot_VeryRare"]),
			nil,
			652,
			652,
			652
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY2, L["raidLoot_Regular"]),
			649,
			652,
			655,
			658
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY2, L["raidLoot_VeryRare"]),
			nil,
			665,
			665,
			665
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY6, L["raidLoot_Regular"]),
			662,
			665,
			668,
			672
		},
		{
			string.format("%s %s", PLAYER_DIFFICULTY6, L["raidLoot_VeryRare"]),
			nil,
			678,
			678,
			678
		}
	}	


end
