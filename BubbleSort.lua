--2016.08.22 By.현식, 버블소트와 관련된 부분만 모아놨음.

bsortList = {"A", "B", "C", "D", "E"}

hList = {} --y측 좌표 랜덤으로 부여하기.
wList = {82, 133, 183, 233, 283} --x측 좌표 

answerList = {} --정답 비교를 위한 리스트.

sortControl = 1

checkedNum = 0
secondCheck = false
secondControl = 1

firstMakeRandomSort = true --최초 1회에만 동작하도록. 일부로 boolean형 사용 안함.

function MakeBubbleSort()
	--처음 버블소트 만들때 길이를 조정하면 가능할 것 같기도 함. hList를 사용해서.
	-- number = love.math.random( min, max ) 표본.
	if firstMakeRandomSort then
		GetRandomHeight()
		BubbleSort()
	end

	DrawBubbleSort()
	UpdateRectSelect()
	UpdateSecondRectSelect()

	love.graphics.setColor(255,255,255,255)

	love.graphics.print(sortControl.."\n"..checkedNum.."\n"..secondControl,
	10,30)

	love.graphics.print(hList[ranNum][1].."\n"..hList[ranNum][2].."\n"..hList[ranNum][3].."\n"..
		hList[ranNum][4].."\n"..hList[ranNum][5].."\n", 10,80)

	love.graphics.setColor(255,0,0,255)

	love.graphics.print(answerList[1].."\n"..answerList[2].."\n"..answerList[3].."\n"..
		answerList[4].."\n"..answerList[5].."\n", 30,80)
end

function GetRandomHeight()
	hPart1 = {90, 100, 30, 120, 70}
	hPart2 = {7, 4, 11, 9, 2}--{20, 35, 70, 50 , 90}
	hPart3 = {120, 30, 44, 70, 100}
	hPart4 = {67, 88, 120, 23, 59}
	hPart5 = {110, 90, 70, 50, 30}

	hList = {hPart1, hPart2, hPart3, hPart4, hPart5}
	ranNum = 4--love.math.random(5)

	for k = 0, table.getn(hList[ranNum]) do
		answerList[k] = hList[ranNum][k]
	end

	firstMakeRandomSort = false
end

function BubbleSort()
	sortLeng = table.getn(hList[ranNum])

	for i = 1, 2 do --5회?4회?만 반복시키면 됨. 몇 회전을 의미.
		for j = 1, sortLeng - i do
			if answerList[j] > answerList[j+1] then
				answerList[j], answerList[j+1] = answerList[j+1], answerList[j]
			end
		end
	end
end

function CheckSameTable(firstList, secondList)
	sameCheck = true
	for i = 1, table.getn(firstList) do 
		if firstList[i] ~= secondList[i] then
			sameCheck = false
		end
	end

	return sameCheck
end

function CortrolBubbleSort()
	if stageLevel == 7 and algoCheck then
--------
		if secondCheck == false then
			ContorlLeftRight()

			if love.keyboard.isDown("return") then
				if CheckSameTable(answerList,hList[ranNum]) then
					--정답일 경우
				else
					--오답일 경우 -> quest.lua의 ControlQuest()참고.
			      	LifeMinus()
			    end
			end

			if love.keyboard.isDown("space") then
		    	secondCheck = true
		    	checkedNum = sortControl

		    	if sortControl == 1 then
		    		secondControl = 2
		    	elseif sortControl == 2 then
		    		secondControl = 1
		    	end
	    	end	
   		else --첫번째 버블소트를 선택했을 경우..
   			ContorlSecondLeftRight()

			if love.keyboard.isDown("space") then
				--선택한것끼리 바뀌게끔. wList도 같이 바뀌어야함.
				--bsortList[checkedNum],bsortList[secondControl] = bsortList[secondControl], bsortList[checkedNum]
				hList[ranNum][checkedNum],hList[ranNum][secondControl] = hList[ranNum][secondControl], hList[ranNum][checkedNum]

				--초기화도 시켜줘야함.
				secondCheck = false
				checkedNum = 0
				sortControl = secondControl

				if sortControl == 1 then
					secondControl = 2
				else
					secondControl = 1
				end
			end
   		end

   		if love.keyboard.isDown("escape") then
   			if secondCheck then
   				secondCheck = false
   			else
   				algoCheck = false
				pl.x = 200
			end
			firstMakeRandomSort = true
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
	love.graphics.setColor(255,0,0,255)

	--그림은 계속 그려지고 있고 컨트롤을 못하도록
	if bsortList[sortControl] == "A" then
		SelectRectA(wList[sortControl]) --이 부분에서 순서대로 값을 부여할 수 있는 방법을 찾아봐야함.
	elseif bsortList[sortControl] == "B" then
		SelectRectB(wList[sortControl]) 
	elseif bsortList[sortControl] == "C" then
		SelectRectC(wList[sortControl])
	elseif bsortList[sortControl] == "D" then
		SelectRectD(wList[sortControl])
	elseif bsortList[sortControl] == "E" then
		SelectRectE(wList[sortControl])
	end --변경된 bsortList의 값을 비교하여 키값을 다시 부여.
end

function UpdateSecondRectSelect()
	love.graphics.setColor(0,0,255,255)

	if secondCheck then
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
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][1], 30, hList[ranNum][1]) --178까지
end

function SecondRectB(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][2], 30, hList[ranNum][2]) --178까지
end

function SecondRectC(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][3], 30, hList[ranNum][3]) --178까지
end

function SecondRectD(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][4], 30, hList[ranNum][4]) --178까지
end

function SecondRectE(xPosition)
	love.graphics.setColor(0,0,255,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][5], 30, hList[ranNum][5]) --178까지
end

------------

function SelectRectA(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	--love.graphics.rectangle("fill", xPosition, 50, 30, 128) --178까지
	--										   └>178-길이	 └>길이
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][1], 30, hList[ranNum][1]) --178까지
end

function SelectRectB(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][2], 30, hList[ranNum][2]) --178까지
end

function SelectRectC(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][3], 30, hList[ranNum][3]) --178까지
end

function SelectRectD(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][4], 30, hList[ranNum][4]) --178까지
end

function SelectRectE(xPosition)
	love.graphics.setColor(255,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][5], 30, hList[ranNum][5]) --178까지
end

-----------------

function DrawRectA(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][1], 30, hList[ranNum][1])
end

function DrawRectB(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][2], 30, hList[ranNum][2])
end

function DrawRectC(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][3], 30, hList[ranNum][3])
end

function DrawRectD(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][4], 30, hList[ranNum][4])
end

function DrawRectE(xPosition)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][5], 30, hList[ranNum][5])
end