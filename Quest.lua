--Quest.lua 및 관련 함수 추가. by.현식 0802

function CheckQuest()
  -- body
  if love.keyboard.isDown('up') and stageLevel > 0 then
    if 215 < pl:GetX() and pl:GetX() < 227 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      questCheck = true
    end
  end
end

function DrawQuest()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(80, 5, 100, 80) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 162, 12, 196, 156) --테두리 안에 흰색 도화지?
end

function ControlQuest()
	if questCheck then
	    if love.keyboard.isDown("return") then --enter키임. 아직 동작 구현 안됨.
	      questCheck = false
	    end

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	    end
	end
end