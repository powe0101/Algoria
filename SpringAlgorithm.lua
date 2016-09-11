suit = nil
input = {text = ""}

COIN_MIN = 0
COIN_MAX = 3
function SetCoinAlgorithmDefault()
	MaxCoin = love.math.random(COIN_MIN,COIN_MAX) -- 떨어지는 코인의 개수
	KeepCoin = 0
	coinCount = 0
	print("MaxCoin : "..MaxCoin)
	print("KeepCoin :"..KeepCoin)
	print("coinCount : "..coinCount)
end

function SpringExplainAlgorithm()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("하늘에서 동전이 저금통으로 들어가요! \n다 떨어지고 난 후에 \n저금통에 얼마가 있을까요?",62+285, 13)
	love.graphics.print("현재까지 모은 돈 : "..KeepCoin,62+285,150)
	love.graphics.print("현재까지 떨어진 동전 : "..coinCount,62+285,200)
  love.graphics.setColor(255,255,255)
end

function DrawBank()
  if bank == nil then
    bank = Bank.Create()
  else
    bank:Draw()
  end
end

function DrawCoin()
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
		suit = require 'suit'
	end
end

function CheckSpringAlgorithmAnswer()
	-- put the layout origin at position (100,100)
	-- the layout will grow down and to the right from this point
	suit.layout:reset(0,0)

	-- put an input widget at the layout origin, with a cell size of 200 by 30 pixels
	suit.Input(input, suit.layout:row(200,30))

	-- put a label that displays the text below the first cell
	-- the cell size is the same as the last one (200x30 px)
	-- the label text will be aligned to the left
	-- put a button of size 200x30 px in the cell below
	-- if the button is pressed, quit the game
	if suit.Button("확인", suit.layout:row()).hit then
		if KeepCoin == input.text then
			--정답
		else
			LifeMinus()
		end
	end

end

function StageSpringAlgorithm()
	if stageLevel ~= 5 then
		return
	end
	SpringExplainAlgorithm()
  DrawCoin()
  DrawBank()
end
