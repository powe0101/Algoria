bsortList = {}

hList = {128, 158, 78, 48, 98}
wList = {82, 133, 183, 233, 283}

sortControl = 1

checkedNum = 0
secondCheck = false
secondControl = 1

function MakeAlgorithm()
	if stageLevel > 4 and algoCheck then
		DrawQuestBackground() --배경그리기.(496*166)
		SplitBackground() --4:4:2 비율로 쪼개기.

		MakeBubbleSort()
	end
	--다 마치면 algoCheck는 다시 false로..
	love.graphics.setColor(255,255,255,255) -- 원상복구
end

function SplitBackground()
	--558을 4:4:2 비율로 쪼개면 223.2, 111.6
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA

	rect = {}

	--love.graphics.rectangle("fill", 62+200, 12, 2, 166) --선처럼 생긴 사각형을 만들기.
	love.graphics.rectangle("fill", 62+400, 12, 2, 166) --선처럼 생긴 사각형을 만들기.

	--love.graphics.line(62+200, 12, 62+200, 178)
	--love.graphics.line(62+400, 12, 62+400, 178)
end

function MakeBubbleSort()
	bsortList = {"A", "B", "C", "D", "E"}

	DrawBubbleSort()
	UpdateRectSelect()
	UpdateSecondRectSelect()

	love.graphics.setColor(255,255,255,255) -- 검은색 RGBA

	he = 10
	for j = 1, table.getn(bsortList) do	
		love.graphics.print(tostring(bsortList[j]).."\n", 10, 50+he)
		he = he + 10
	end
end

function CortrolBubbleSort()
	if stageLevel == 7 and algoCheck then
--------
		if secondCheck == false then
			ContorlLeftRight()

			if love.keyboard.isDown("space") then
		    	secondCheck = true
		    	checkedNum = sortControl
	    	end	
   		else --첫번째 버블소트를 선택했을 경우..
   			ContorlSecondLeftRight()

			if love.keyboard.isDown("space") then
				--선택한것끼리 바뀌게끔. wList도 같이 바뀌어야함.
				bsortList[checkedNum],bsortList[secondControl] = bsortList[secondControl], bsortList[checkedNum]
				wList[checkedNum], wList[secondControl] = wList[secondControl], wList[checkedNum]

				--초기화도 시켜줘야함.
				secondCheck = false
				checkedNum = 0
				--sortControl = 1
				--secondControl = 1
			end
   		end

   		if love.keyboard.isDown("escape") then
   			if secondCheck then
   				secondCheck = false
   			else
   				algoCheck = false
				pl.x = 200
			end
   		end
--------
	end
end

function ContorlLeftRight()
	if love.keyboard.isDown("left") then
	   	if sortControl == 1 then
		   	--1번 선택지에서 왼쪽으로 가면 아무 동작도 안함.
	   	else
	   		sortControl = sortControl - 1
	   	end
	end
    			
    if love.keyboard.isDown("right") then
    	if sortControl == 5 then
    		--5번 선택지에서 오른쪽으로 가면 아무 동작도 안함.
    	else
    		sortControl = sortControl + 1
    	end
    end	
end

function ContorlSecondLeftRight()
	if love.keyboard.isDown("left") then
	   	if secondControl == 1 then
		   	--1번 선택지에서 왼쪽으로 가면 아무 동작도 안함.
		elseif secondControl == 2 and checkedNum == 1 then
    		-- 암것도 안함.
    	elseif secondControl - 1 == checkedNum then
    		secondControl = secondControl - 2
	   	else
	   		secondControl = secondControl - 1
	   	end
	end
    			
    if love.keyboard.isDown("right") then
    	if secondControl == 5 then
    		--5번 선택지에서 오른쪽으로 가면 아무 동작도 안함.
    	elseif secondControl == 4 and checkedNum == 5 then
    		-- 암것도 안함.
    	elseif secondControl + 1 == checkedNum then
    		secondControl = secondControl + 2
    	else
    		secondControl = secondControl + 1
    	end
    end	
end

function UpdateRectSelect()
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.print(tostring(secondCheck)..bsortList[sortControl]
		..sortControl, 20, 30)

	--그림은 계속 그려지고 있고 컨트롤을 못하도록
	if bsortList[sortControl] == "A" then
		SelectRectA(wList[sortControl])
	elseif bsortList[sortControl] == "B" then
		SelectRectB(wList[sortControl])
	elseif bsortList[sortControl] == "C" then
		SelectRectC(wList[sortControl])
	elseif bsortList[sortControl] == "D" then
		SelectRectD(wList[sortControl])
	elseif bsortList[sortControl] == "E" then
		SelectRectE(wList[sortControl])
	end
end

function UpdateSecondRectSelect()
	love.graphics.setColor(0,0,255,255) -- 검은색 RGBA
	love.graphics.print(bsortList[secondControl]..secondControl, 20, 30)

	if secondCheck == true then
		if bsortList[secondControl] == "A" then
			SecondRectA(wList[secondControl])
		elseif bsortList[secondControl] == "B" then
			SecondRectB(wList[secondControl])
		elseif bsortList[secondControl] == "C" then
			SecondRectC(wList[secondControl])
		elseif bsortList[secondControl] == "D" then
			SecondRectD(wList[secondControl])
		elseif bsortList[secondControl] == "E" then
			SecondRectE(wList[secondControl])
		end
	end
end

function DrawBubbleSort()
	for i = 1, table.getn(bsortList) do	
		if bsortList[i] == "A" then
			DrawRectA(wList[i])
		elseif bsortList[i] == "B" then
			DrawRectB(wList[i])
		elseif bsortList[i] == "C" then
			DrawRectC(wList[i])
		elseif bsortList[i] == "D" then
			DrawRectD(wList[i])
		elseif bsortList[i] == "E" then
			DrawRectE(wList[i])
		end
	end
end

function SecondRectA(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("line", xPosition, 50, 30, 128) --178까지
end

function SecondRectB(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("line", xPosition, 20, 30, 158) --178까지
end

function SecondRectC(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("line", xPosition, 100, 30, 78) --178까지
end

function SecondRectD(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("line", xPosition, 130, 30, 48) --178까지
end

function SecondRectE(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("line", xPosition, 80, 30, 98) --178까지
end

------------

function SelectRectA(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 50, 30, 128) --178까지
end

function SelectRectB(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 20, 30, 158) --178까지
end

function SelectRectC(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 100, 30, 78) --178까지
end

function SelectRectD(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 130, 30, 48) --178까지
end

function SelectRectE(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 80, 30, 98) --178까지
end

-----------------

function DrawRectA(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 50, 30, 128) --178까지
end

function DrawRectB(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 20, 30, 158) --178까지
end

function DrawRectC(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 100, 30, 78) --178까지
end

function DrawRectD(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 130, 30, 48) --178까지
end

function DrawRectE(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("line", xPosition, 80, 30, 98) --178까지
end