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

function SetCoinAlgorithmDefault()
	MaxCoin = love.math.random(5,10) -- 떨어지는 코인의 개수
	KeepCoin = 0
	coinCount = 0
	print("MaxCoin : "..MaxCoin)
	print("KeepCoin :"..KeepCoin)
	print("coinCount : "..coinCount)
end

function SpringExplainAlgorithm()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("하늘에서 동전이 저금통으로 들어가요! \n다 떨어지고 난 후에 저금통에 얼마가 있을까요?",62+285, 13)
	love.graphics.print("현재까지 모은 돈 : "..KeepCoin,62+285,50)
	love.graphics.print("현재까지 떨어진 동전 : "..coinCount,62+285,100)
end

function StageSpringAlgorithm()
	if stageLevel ~= 5 then
		return
	end
	SpringExplainAlgorithm()

	if coin == nil and coinCount < MaxCoin then
			coin = Coin.Create()
			KeepCoin = KeepCoin + coin:GetPoint()
			coinCount = coinCount + 1
	elseif coin ~= nil then
		coin:Draw()
		coin:Update()

		if coin:GetY() == 130 then
					coin = nil
		end
	elseif coin == nil and coinCount == MaxCoin then
			-- PrintAnswer()
			-- 정답 선택을 어떻게 할것인가?
	end
end
