-- Made : 2016/09/03 - G
-- Name : Coin.lua

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
  self.x = 200
  self.y = 13
  self:RegisterImage(self.point)
end

function Coin:RegisterImage(_point)
  print(_point)
  if _point == 10 then
    imgCoin = love.graphics.newImage("images/10_coin.png")
  elseif _point == 50 then
    imgCoin = love.graphics.newImage("images/50_coin.png")
  elseif _point == 100 then
    imgCoin = love.graphics.newImage("images/100_coin.png")
  end
end
function Coin:GetPoint()
  return self.point
end

function Coin:SelectCoinRandom()
  local random = love.math.random(0,2)
  print("선택된 코인 랜덤 값 : "..random)

  if random == 0 then
    return 10
  elseif random == 1 then
    return 50
  elseif random == 2 then
    return 100
  end

end

function Coin:GetY()
  return self.y
end

function Coin:Draw()
  love.graphics.draw(imgCoin,coin_frame,self.x,self.y)
end

function Coin:Update()
  self.y = self.y + 1 -- 계속 떨어져야 하므로.
end
