function DrawMultipleTutorialChoice() --문제를 풀고 넘어가야 하는 객관식 방식. -- ~258 / 168
	if multipleChoice == 1 then
		DrawTutorialChoiceOne()
	elseif multipleChoice == 2 then
		DrawTutorialChoiceTwo()
	elseif multipleChoice == 3 then
		DrawTutorialChoiceThree()
	elseif multipleChoice == 4 then
		DrawTutorialChoiceFour()
	end
end

function DrawTutorialChoiceOne()
	--love.graphics.rectangle("line", 100,150,50, 30) --정답을 사각형으로 체크할 경우

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(tutorialAnswer1,answer_now_frame,100,145)
	love.graphics.draw(tutorialAnswer2,answer_now_frame,200,145)
	love.graphics.draw(tutorialAnswer3,answer_now_frame,300,145)
	love.graphics.draw(tutorialAnswer4,answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 114, 164, 8, 11, 100) -- 정답을 체크하는 원 그리기. ※0805. 후에 정답 이미지가 변경되면 좌표값이나 사이즈값을 수정할 필요가 있음.

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTutorialChoiceTwo()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(tutorialAnswer1,answer_now_frame,100,145)
	love.graphics.draw(tutorialAnswer2,answer_now_frame,200,145)
	love.graphics.draw(tutorialAnswer3,answer_now_frame,300,145)
	love.graphics.draw(tutorialAnswer4,answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 214, 164, 8, 11, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTutorialChoiceThree()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(tutorialAnswer1,answer_now_frame,100,145)
	love.graphics.draw(tutorialAnswer2,answer_now_frame,200,145)
	love.graphics.draw(tutorialAnswer3,answer_now_frame,300,145)
	love.graphics.draw(tutorialAnswer4,answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 314, 164, 8, 11, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTutorialChoiceFour()
	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
	love.graphics.draw(tutorialAnswer1,answer_now_frame,100,145)
	love.graphics.draw(tutorialAnswer2,answer_now_frame,200,145)
	love.graphics.draw(tutorialAnswer3,answer_now_frame,300,145)
	love.graphics.draw(tutorialAnswer4,answer_now_frame,400,145)

	love.graphics.setColor(255,0,0,255)
	love.graphics.ellipse("line", 414, 164, 8, 11, 100) -- 정답을 체크하는 원 그리기

	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function TutorialLoad()
	tutorialTip1 = love.graphics.newImage("images/tutorial/tutorialTip1.png")
	tutorialTip1:setFilter("nearest","nearest")
	tutorialTip2 = love.graphics.newImage("images/tutorial/tutorialTip2.png")
	tutorialTip2:setFilter("nearest","nearest")

	tutorialQuest = love.graphics.newImage("images/tutorial/tutorialQuest.png")
	tutorialQuest:setFilter("nearest","nearest")

	tutorialAnswer1 = love.graphics.newImage("images/tutorial/tutorialAnswer1.png")
	tutorialAnswer1:setFilter("nearest","nearest")
	tutorialAnswer2 = love.graphics.newImage("images/tutorial/tutorialAnswer2.png")
	tutorialAnswer2:setFilter("nearest","nearest")
	tutorialAnswer3 = love.graphics.newImage("images/tutorial/tutorialAnswer3.png")
	tutorialAnswer3:setFilter("nearest","nearest")
	tutorialAnswer4 = love.graphics.newImage("images/tutorial/tutorialAnswer4.png")
	tutorialAnswer4:setFilter("nearest","nearest")

	tutorialTipList = {tutorialTip1, tutorialTip2}
end