Coin = {}
Coin.__index = Coin

coin_frame = love.graphics.newQuad(0, 0, 32, 32, 32, 32)

function Coin.Create()
  local self = {}
  setmetatable(self,Coin)
  self:Reset()
  return self
end

function Coin:Reset()
  self.width = 32
  self.height = 32
  self.point = Coin:SelectCoinRandom()  -- Random 값으로 동전 선택 0~2 (10,50,100)
  self.visible = true

  self:RegisterImage(self.point)
end

function Coin:RegisterImage(_point)
  if _point == 10 then

  elseif _point == 50 then

  elseif _point == 100 then

  end

end

function Coin:SelectCoinRandom()
  local random = randomSeed:newRandomGenerator(0,2)
  print("선택된 코인 랜덤 값 : "..random)

  if random == 0 then
    return 10
  elseif random == 1 then
    return 50
  elseif random == 2 then
    return 100
  end
end

function Coin:Draw()
  love.graphics.draw(imgCoin,coin_frame,0,WIDTH/2)
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
