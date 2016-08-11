-- Made : 2016/08/10 - G
-- Name : DustWind.lua
DustWind = {}
DustWind.__index = DustWind

function DustWind.Create()
	local self = {}
	setmetatable(self, DustWind)
	self:Reset()

	return self
end

function DustWind:Reset()
	-- Initialize
end

function DustWind:Play()
	-- 바람을 맞아라
end

function DustWind:ChangeBlocks()
	-- 솔
end