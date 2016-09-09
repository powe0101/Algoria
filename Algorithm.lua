fontOnceCheck = true
fallCorrectAnswer = false
bossClearCheck = false
printBossClear = false

function MakeAlgorithm()
	if stageLevel > 4 and algoCheck then
		DrawQuestBackground() --배경그리기.(496*166)
		SplitBackground() --4:4:2 비율로 쪼개기.

		StageSpringAlgorithm()

		if stageLevel == 7 then
			MakeBubbleSort() --가을스테이지에서만 돌아가도록 태스팅.
			if fontOnceCheck then
				SetNanumFont()
				fontOnceCheck = false
			end

			if fallCorrectAnswer then
				PrintWhenCorrectAnswer()
			else
				PrintFallExplanation()
			end
		end
	end
	--다 마치면 algoCheck는 다시 false로..
	love.graphics.setColor(255,255,255,255) -- 원상복구
end

function SetCoinAlgorithmDefault()
	MaxCoin = love.math.random(5,10) -- 떨어지는 코인의 개수
	KeepCoin = 0
	coinCount = 0
	print("MaxCoin : "..MaxCoin)
	print("KeepCoin :"..KeepCoin)
	print("coinCount : "..coinCount)
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

function SpringExplainAlgorithm()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("하늘에서 동전이 저금통으로 들어가요! \n다 떨어지고 난 후에 저금통에 얼마가 있을까요?",62+285, 13)
	love.graphics.print("현재까지 모은 돈 : "..KeepCoin,62+285,50)
	love.graphics.print("현재까지 떨어진 동전 : "..coinCount,62+285,100)
end

function SplitBackground()
	--558을 4:4:2 비율로 쪼개면 223.2, 111.6
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA

	--love.graphics.rectangle("fill", 62+200, 12, 2, 166) --선처럼 생긴 사각형을 만들기.
	love.graphics.rectangle("fill", 62+280, 12, 2, 166) --선처럼 생긴 사각형을 만들기.

	--love.graphics.line(62+200, 12, 62+200, 178)
	--love.graphics.line(62+400, 12, 62+400, 178)
end

function PrintFallExplanation()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("문제!\n다음과 같이 정렬되지 않은 데이터들이 \n있을때, 버블정렬을 사용하여\n2회전 했을때의 결과물을 만들어 봐라!",62+285, 13)

	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("\n※조작법※\n\n'↑' : 정답여부를 확인할 수 있다.\n'Space' : 데이터를 교환한다.\n'←,→' : 선택한 막대기를 좌우로\n변경할 수 있다.' " ,62+285, 80)
	--정답을 맞추면 이부분에 '정답!' 이라고 메시지를 바뀌게 하고 스킵할수있는 기능도 추가. 또한 스테이지 종료도.
end

function PrintWhenCorrectAnswer()
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("정답입니다!\n처음부터 끝까지의 버블정렬 과정을 \n보여줍니다!",62+285, 50)

	love.graphics.setColor(0, 0, 0, 255)
	--love.graphics.print("\n※조작법※\n\n'↑' : 정답여부를 확인할 수 있다.\n'Space' : 데이터를 교환한다.\n'←,→' : 선택한 막대기를 좌우로\n변경할 수 있다.' " ,62+285, 80)
	--정답을 맞추면 이부분에 '정답!' 이라고 메시지를 바뀌게 하고 스킵할수있는 기능도 추가. 또한 스테이지 종료도.
end

function DrawBossClear()
	--보스를 깨면 엔터키를 누를 수 있게끔. 바로 넘어가면 알고리즘이 완성된걸 못보잖아.
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print("정렬이 끝났습니다! \n 확인하셨다면 'Enter'를 눌러주세요.",62+285, 120)
	love.graphics.setColor(0, 0, 0, 255)
end
