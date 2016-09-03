Coin = {}
Coin.__index = Coin

function Coin.Create()
  local self = {}
  setmetatable(self,Coin)
  self:Reset()
  return self
end

function Coin:Reset()
  self.point = 0 -- 동전 * 돈
  self.coin = 0 -- 저금통에 저장된 돈
  self.count = 0 -- 저금통에 저장된 동전 개수
  self.width = 300
  self.height = 150
  self.random = 0  -- Random 값으로 동전 선택 0~2 (50,100,500)
end

function Coin:Play()
  --애니메이션 재생
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
