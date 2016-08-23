function MakeAlgorithm()
	if stageLevel > 4 and algoCheck then
		DrawQuestBackground() --배경그리기.(496*166)
		SplitBackground() --4:4:2 비율로 쪼개기.

		if stageLevel == 7 then 
			MakeBubbleSort() --가을스테이지에서만 돌아가도록 태스팅.
		end
	end
	--다 마치면 algoCheck는 다시 false로..
	love.graphics.setColor(255,255,255,255) -- 원상복구
end

function SplitBackground()
	--558을 4:4:2 비율로 쪼개면 223.2, 111.6
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA

	--love.graphics.rectangle("fill", 62+200, 12, 2, 166) --선처럼 생긴 사각형을 만들기.
	love.graphics.rectangle("fill", 62+400, 12, 2, 166) --선처럼 생긴 사각형을 만들기.

	--love.graphics.line(62+200, 12, 62+200, 178)
	--love.graphics.line(62+400, 12, 62+400, 178)
end