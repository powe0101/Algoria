function MakeAlgorithm()
	if stageLevel > 4 then
		DrawQuestBackground() --배경그리기.
		SplitBackground() --4:4:2 비율로 쪼개기.
	end
	--다 마치면 algoCheck는 다시 false로..
end

function SplitBackground()
	--558을 4:4:2 비율로 쪼개면 223.2, 111.6
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.line(62+200, 12, 62+200, 178)
	love.graphics.line(62+400, 12, 62+400, 178)
end