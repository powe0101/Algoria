COIN_MIN = 4
COIN_MAX = 7

UI_X = 350
UI_Y = 80

springClearCheck = false

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
	if SCALE ~= 1 then
		local x,y = suit.getMousePosition()
		suit.updateMouse(x/SCALE,y/SCALE)
	end

	suit.layout:reset(0,0)

	-- put an input widget at the layout origin, with a cell size of 200 by 30 pixels
	suit.Input(input, UI_X,UI_Y,200,30)
	if SCALE ~= 1 then
		suit.Label("입력값 : "..input.text,{align="left"},UI_X,UI_Y,200,30)
	end

	-- put a label that displays the text below the first cell
	-- the cell size is the same as the last one (200x30 px)
	-- the label text will be aligned to the left
	-- put a button of size 200x30 px in the cell below
	-- if the button is pressed, quit the game
	if suit.Button("정답 확인", UI_X,UI_Y+40,200,30).hit then
		print(KeepCoin..input.text)
		if tostring(KeepCoin) == input.text then
			springClearCheck = true
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
	if suit ~= nil then
		CheckSpringAlgorithmAnswer()
	end
end

function CheckSpringClear() -- using at main
	if springClearCheck and stageLevel == 5 then
		algoCheck = false
		bossTalkCheck = false
		bossClearCheck = true
	  	BossListDelete()
	  	springClearCheck = false
	end
end
