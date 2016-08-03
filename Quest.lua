--Quest.lua 및 관련 함수 추가. by.현식 0802

phase = 1 --표지판을 통한 퀘스트 단계. 다리가 3번 열려야 하니 페이즈는 총 3단계가 존재. by.현식 0802
multipleChoice = 1

function CheckQuest()
  -- body
  if love.keyboard.isDown('up') then
  	if stageLevel == 1 then
  		if 215 < pl:GetX() and pl:GetX() < 227 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      		questCheck = true
    	end
  	elseif stageLevel == 3 then --가을
    	if 290 < pl:GetX() and pl:GetX() < 330 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      		questCheck = true
    	end
    end
  end
end

function DrawQuest()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
  	DrawRectangle(80, 5, 100, 80) --검은색 테두리
  	love.graphics.setColor(255,255,255,255)
  	love.graphics.rectangle("fill", 162, 12, 196, 156) --테두리 안에 흰색 도화지?

  	love.graphics.draw(imgTest,test_now_frame,162,12) --테스트용
  	if phase == 1 then
  		DrawTip()
  	end
  	-- 단순 엔터쳐서 넘어가는 문제도 있겠지만 난이도가 올라가면 이 부분에서도 4지선다로 문제를 풀 수 
  	-- 있도록 하고 팝업창이 위/아래로 넘기듯이 여기선 좌/우로 넘겨서 맞는 답이면 클리어와 동시에
  	-- 다리가 올라올수 있도록 하고 틀리면 라이프가 깍이고 창은 계속 떠있는 방식?으로 지금은 생각중.
  	-- 그러기 위해서는 라이프 개념도 구현해야 함. 또 동시에 세이브에 대한 필요성도 있음.
  	-- 각 스테이지와 페이즈를 가리키는 변수인 stageLevel과 phase를 이용해서 적절히 문제를 내면 될 듯.
  	-- 그렇게 하면 퀘스트는 5(파이널 스테이지, 보스 스테이지) x 3 정도에 여분의 문제까지 준비하면 될듯.
  	-- 문제는 이미지로 미리 준비해서 띄워주는 방식으로.
  	-- 내일 나머지 구현할 것. by. 현식 0802

  	love.graphics.setColor(255,255,255,255) -- 하얀색 RGBA로 마무리해야함.
end

function DrawTip() --단순히 읽고 넘어갈 수 있는 팁방식.
	love.graphics.setColor(0,0,0,255)

	love.graphics.print("If you understand, press enter", 165, 150) -- 한글깨짐. 폰트추가해야됨.
end

function DrawMultipleChoice() --문제를 풀고 넘어가야 하는 객관식 방식. -- ~258 / 168
	love.graphics.setColor(0,0,0,255)

	love.graphics.print("① 마이충", 165, 150) -- 한글깨짐. 폰트추가해야됨.
	love.graphics.print("② 베인충", 215, 150)
	love.graphics.print("③ 티모충", 265, 150)
	love.graphics.print("④ 잭스충", 315, 150)
	--love.graphics.print("⑤") --5지선다로 할때 사용
end

function ControlQuest() 
	if questCheck then
	    if phase == 1 then --1번째는 Tip.
	    	if love.keyboard.isDown("return") then --enter키임. 
	      		questCheck = false
	      		phase = phase + 1
	      		BridegePassValue = BridegePassValue + 29
	      	end
	    end

	    if phase == 2 then --2번째 객관식 문제.
	      	if love.keyboard.isDown("left") then
	      		if multipleChoice == 1 then
	      		   	--1번 선택지에서 왼쪽으로 가면 아무 동작도 안함.
	        	else
	        		multipleChoice = multipleChoice - 1
	        	end
	        end
    			
    		if love.keyboard.isDown("right") then
     			if multipleChoice == 4 then
        			--4번 선택지에서 오른쪽으로 가면 아무 동작도 안함.
      			else
        			multipleChoice = multipleChoice + 1
      			end
    		end

    		if love.keyboard.isDown("return") then --enter키임. 
    			--이하는 정답일 경우에만. 정답인지 아닌지를 가리기 위해서는 이걸 테이블로 만드는게 나을 것 같음.
	      		questCheck = false
	      		phase = phase + 1
	      		BridegePassValue = BridegePassValue + 29
	      	end
	    end

	    if love.keyboard.isDown("escape") then -- esc누르면 아무일도 일어나지 않고 퀘스트창이 닫힘.
	      questCheck = false
	    end
	end
end