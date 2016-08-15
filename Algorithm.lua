function MakeAlgorithm()
	if stageLevel > 4 then
		DrawQuestBackground() --배경그리기.(496*166)
		SplitBackground() --4:4:2 비율로 쪼개기.

		--테스트 중,..
		test_frames = love.graphics.newQuad(0,0,200,166,200,166)
		test_frames2 = love.graphics.newQuad(0,0,96,166,96,166)

		love.graphics.draw(imgTest1,test_frames,62, 12) --좌측 문제
		love.graphics.draw(imgTest2,test_frames,263, 12) --우측 문제
		love.graphics.draw(imgTest3,test_frames2,465, 12) --정답지 부분

	end
	--다 마치면 algoCheck는 다시 false로..
end

function SplitBackground()
	--558을 4:4:2 비율로 쪼개면 223.2, 111.6
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA

	love.graphics.rectangle("fill", 62+200, 12, 2, 166) --선처럼 생긴 사각형을 만들기.
	love.graphics.rectangle("fill", 62+400, 12, 2, 166) --선처럼 생긴 사각형을 만들기.

	--love.graphics.line(62+200, 12, 62+200, 178)
	--love.graphics.line(62+400, 12, 62+400, 178)
	love.graphics.setColor(255,255,255,255) -- 원상복구
end