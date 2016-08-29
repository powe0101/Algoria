bsortList = {"A", "B", "C", "D", "E"}

hList = {} --y측 좌표 랜덤으로 부여하기.
wList = {82, 133, 183, 233, 283} --x측 좌표 

bubbleSortAnswerList = {} --정답 비교를 위한 리스트.
sortInitList = {} --초기화에 필요할지도 모르는 리스트.

sortControl = 1

checkedNum = 0
secondCheck = false
secondControl = 1

bubbleSortAniCheckCount = 1

firstMakeRandomSort = true --최초 1회에만 동작하도록. 일부로 boolean형 사용 안함.
animationCheck = 0
test_i = 1
test_j = 1

completeCount = 0

function MakeBubbleSort()
	--처음 버블소트 만들때 길이를 조정하면 가능할 것 같기도 함. hList를 사용해서.
	-- number = love.math.random( min, max ) 표본.
	if firstMakeRandomSort then
		GetRandomHeight()
		GetBubbleSortAnswer()
	end

	if animationCheck ~= 0 then
		if animationCheck > 1 then
			BubbleSortAnimation(hList[ranNum],5)
		end
		if bubbleSortAniCheckCount == 2 then
			InitSort(hList[ranNum])
		end
	end

	DrawBubbleSort()
	UpdateRectSelect()
	UpdateSecondRectSelect()
	UpdateRectValue()

	love.graphics.setColor(255,255,255,255)

	love.graphics.print(sortControl.."\n"..checkedNum.."\n"..secondControl,
	10,30)

	love.graphics.print(hList[ranNum][1].."\n"..hList[ranNum][2].."\n"..hList[ranNum][3].."\n"..
		hList[ranNum][4].."\n"..hList[ranNum][5].."\n", 10,80)

	love.graphics.setColor(255,0,0,255)

	love.graphics.print(bubbleSortAnswerList[1].."\n"..bubbleSortAnswerList[2].."\n"..bubbleSortAnswerList[3].."\n"..
		bubbleSortAnswerList[4].."\n"..bubbleSortAnswerList[5].."\n", 30,80)
end

function GetRandomHeight()
	hPart1 = {90, 100, 30, 120, 70}
	hPart2 = {20, 35, 70, 50 , 90}
	hPart3 = {120, 30, 44, 70, 100}
	hPart4 = {67, 88, 120, 23, 59}
	hPart5 = {110, 90, 70, 50, 30}
	hPart6 = {70, 40, 110, 90, 20}
	hPart7 = {80, 30, 50, 40, 90}
	hPart8 = {110, 30, 50, 90, 70}
	hPart9 = {30, 50, 70, 76, 25}
	hPart10 = {130, 110, 10, 30, 80}

	hList = {hPart1, hPart2, hPart3, hPart4, hPart5,
				hPart6, hPart7, hPart8, hPart9, hPart10}
	ranNum = 5--love.math.random(10)

	for k = 0, table.getn(hList[ranNum]) do
		bubbleSortAnswerList[k] = hList[ranNum][k]
	end

	for l = 0, table.getn(hList[ranNum]) do
		sortInitList[l] = hList[ranNum][l]
	end	

	firstMakeRandomSort = false
end

function GetBubbleSortAnswer()
	sortLeng = table.getn(hList[ranNum])

	for i = 1, 2 do --5회?4회?만 반복시키면 됨. 몇 회전을 의미.
		for j = 1, sortLeng - i do
			if bubbleSortAnswerList[j] > bubbleSortAnswerList[j+1] then
				bubbleSortAnswerList[j], bubbleSortAnswerList[j+1] = bubbleSortAnswerList[j+1], bubbleSortAnswerList[j]
			end
		end
	end
end

function InitSort(list)
	for l = 0, table.getn(sortInitList) do
		list[l] = sortInitList[l]
	end	
	bubbleSortAniCheckCount = 1
	animationCheck = 2
	sortControl = 6
end

function BubbleSortAnimation(list, count) --for문을 if문으로.
	if test_i == 1 and test_j == 1 then
		love.timer.sleep(0.5)
		--여기서 안내창을 바꿔주면 될듯.
	end
	sortLeng = table.getn(hList[ranNum])
	secondCheck = true

	if test_i < count then
		if test_j < sortLeng - test_i + 1 then
			sortControl = test_j
			secondControl = test_j + 1

			--여기서 컬러지정
			if list[test_j] > list[test_j+1] then
				list[test_j], list[test_j+1] = list[test_j+1], list[test_j]				
			end	
			love.timer.sleep(1)
			--원래는 슬립을 여기서 걸어줘야함.
			test_j = test_j + 1
		else 
			test_j = 1
			test_i = test_i + 1
			completeCount = completeCount + 1
		end
	else
		--초기화는 임시로 해놓고 여기서는 이제 스테이지가 종료되어야함!
		test_i = 1
		test_j = 1
		animationCheck = 0
		sortControl = 6
		secondCheck = false
		completeCount = completeCount + 1
		--fallCorrectAnswer = false --어자피 스테이지가 깨지는 부분이기 떄문에 굳이 초기화할 필요는 없을듯.
	end
	--[[
	for i = 1, count do --5회?4회?만 반복시키면 됨. 몇 회전을 의미.
		for j = 1, sortLeng - i do
			if list[j] > list[j+1] then
				list[j], list[j+1] = list[j+1], list[j]
				love.timer.sleep(0.3)
			end
		end
	end
	]]--
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

			if love.keyboard.isDown("up") and animationCheck == 0 then
				if CheckSameTable(bubbleSortAnswerList,hList[ranNum]) then
					--정답일 경우
					bubbleSortAniCheckCount = 2
					animationCheck = 1
					fallCorrectAnswer = true
				else
					--오답일 경우 -> quest.lua의 ControlQuest()참고.
			      	LifeMinus()
			    end
			end

			if love.keyboard.isDown("space") then
		    	secondCheck = true
		    	checkedNum = sortControl

		    	if checkedNum == 1 then
		    		secondControl = 2
		    	elseif checkedNum == 2 then
		    		secondControl = 1
		    	else
		    		secondControl = 1
		    	end
	    	end	

	    	if love.keyboard.isDown("escape") then
   				algoCheck = false
				pl.x = 200
				firstMakeRandomSort = true
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
   			secondCheck = false
   		end
--------
	end
end

------------------------ 이 아래로는 거의 볼 필요가 없음.

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

function UpdateRectValue()
	for i = 1, table.getn(bsortList) do	
		if bsortList[i] == "A" then
			PrintRectA(wList[i])
		elseif bsortList[i] == "B" then
			PrintRectB(wList[i])
		elseif bsortList[i] == "C" then
			PrintRectC(wList[i])
		elseif bsortList[i] == "D" then
			PrintRectD(wList[i])
		elseif bsortList[i] == "E" then
			PrintRectE(wList[i])
		end
	end
end



---------------------------------------------------

function PrintRectA(xPosition)
	love.graphics.setColor(0,0,0,255) 
	love.graphics.print(hList[ranNum][1], xPosition+2, 150-hList[ranNum][1])
end

function PrintRectB(xPosition)
	love.graphics.setColor(0,0,0,255) 
	love.graphics.print(hList[ranNum][2], xPosition+2, 150-hList[ranNum][2])
end

function PrintRectC(xPosition)
	love.graphics.setColor(0,0,0,255) 
	love.graphics.print(hList[ranNum][3], xPosition+2, 150-hList[ranNum][3])
end

function PrintRectD(xPosition)
	love.graphics.setColor(0,0,0,255) 
	love.graphics.print(hList[ranNum][4], xPosition+2, 150-hList[ranNum][4])
end

function PrintRectE(xPosition)
	love.graphics.setColor(0,0,0,255) 
	love.graphics.print(hList[ranNum][5], xPosition+2, 150-hList[ranNum][5])
end

-----------------------------------

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
	love.graphics.setColor(255,0,0,255)
	--love.graphics.rectangle("fill", xPosition, 50, 30, 128) --178까지
	--										   └>178-길이	 └>길이
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][1], 30, hList[ranNum][1]) --178까지
end

function SelectRectB(xPosition)
	love.graphics.setColor(255,0,0,255) 
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][2], 30, hList[ranNum][2]) --178까지
end

function SelectRectC(xPosition)
	love.graphics.setColor(255,0,0,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][3], 30, hList[ranNum][3]) --178까지
end

function SelectRectD(xPosition)
	love.graphics.setColor(255,0,0,255)
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][4], 30, hList[ranNum][4]) --178까지
end

function SelectRectE(xPosition)
	love.graphics.setColor(255,0,0,255) 
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][5], 30, hList[ranNum][5]) --178까지
end

-----------------

function DrawRectA(xPosition)
	if 4 < completeCount then
		love.graphics.setColor(0,255,0,255)
	else
		love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	end
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][1], 30, hList[ranNum][1])
end

function DrawRectB(xPosition)
	if 3 < completeCount then
		love.graphics.setColor(0,255,0,255)
	else
		love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	end
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][2], 30, hList[ranNum][2])
end

function DrawRectC(xPosition)
	if 2 < completeCount then
		love.graphics.setColor(0,255,0,255)
	else
		love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	end
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][3], 30, hList[ranNum][3])
end

function DrawRectD(xPosition)
	if 1 < completeCount then
		love.graphics.setColor(0,255,0,255)
	else
		love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	end
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][4], 30, hList[ranNum][4])
end

function DrawRectE(xPosition)
	if 0 < completeCount then
		love.graphics.setColor(0,255,0,255)
	else
		love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	end
	love.graphics.rectangle("fill", xPosition, 178-hList[ranNum][5], 30, hList[ranNum][5])
end