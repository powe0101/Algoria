Coin = {}
Coin.__index = Coin

function Coin.Create()
  local self = {}
  setmetatable(self,Coin)
  self:Reset()
  return self
end

function Coin:Reset()
  self.point = 0
  self.coin = 0
  self.count = 0
  self.width = 300
  self.height = 150
  
end

function Coin:Play()

end

function Coin:Stop()

end

function Coin:Draw()

end

function Coin:Update()

end

function Coin:CheckAnswer()

end

function Coin:Clear()

end

function Coin:Release()

end

function Coin:AddCoin()

end

function Coin:AddPoint()

end
