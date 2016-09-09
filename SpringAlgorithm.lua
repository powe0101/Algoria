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
	love.graphics.print("하늘에서 동전이 저금통으로 들어가요! \n다 떨어지고 난 후에 \n저금통에 얼마가 있을까요?",62+285, 13)
	love.graphics.print("현재까지 모은 돈 : "..KeepCoin,62+285,50)
	love.graphics.print("현재까지 떨어진 동전 : "..coinCount,62+285,100)
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
			-- PrintAnswer()
			-- 정답 선택을 어떻게 할것인가?
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
