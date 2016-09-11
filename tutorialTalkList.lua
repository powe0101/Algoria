----------------------이하 대화내용
function FinalElderTalk()
 	love.graphics.print("어떻니 알. 잘 할 수 있겠니?", 365, 32)
 	--love.graphics.print("이정도면 너를 믿고 맡겨도", 365, 52)
end

function ElderTipTalk1()                                    --여기까지
	love.graphics.setColor(0,255,0,255)
	love.graphics.print("봄의 성,", 80, 22)
	love.graphics.setColor(0,0,255,255)
	love.graphics.print("여름의 성,", 128, 22)
	love.graphics.setColor(255,128,0,255)
	love.graphics.print("가을의 성,", 188, 22)
	love.graphics.setColor(0,30,100,255)
	love.graphics.print("겨울의 성", 248, 22)
	--봄의 성, 여름의 성, 가을의 성, 겨울의 성
	
	SetBlackColor()
	love.graphics.print("마왕은                                                         까지 총 4개의 성           을 가지고 있단다.", 35, 22)
	love.graphics.print("지금은 봄의 성에서 머무리고 있다는 소리가 들리는구나. ", 35, 52)
	SetBlueColor()
	love.graphics.print("장애물", 280, 82)
	SetBlackColor()
	love.graphics.print("하지만! 각각의 성까지 가는 데는 여러가지의               	    들이 있을거야", 35, 82)
	love.graphics.print("마왕은 자신의 성으로 오는 것을 막기위해 성의 위치를 이상한 곳에 숨겨두었거나", 35, 112)
	SetBlueColor()
	love.graphics.print("문제", 35, 142)
	SetBlackColor()
	love.graphics.print("를 풀어야만 통과할 수 있는 장애물          을 설치하기도 했다고 한다.", 60, 142)
end

function ElderTipTalk2()
	love.graphics.print("차근차근 문제를 풀어나간다면 큰 문제없이 성에 도착할 수 있을 것이다.", 35, 12)
	love.graphics.print("하지만 진짜 문제는 성에 도착하고 난 다음이다!", 35, 42)
	love.graphics.print("마왕의 성을 도착하면 마왕이 내는 문제를 풀어야 한단다.", 35, 62)
	SetBlackColor()
	love.graphics.print("마왕이 내는 문제", 105, 82)
	love.graphics.setColor(255,0,0,255)
	love.graphics.print("'알고리즘'", 205, 82)
	SetBlackColor()
	love.graphics.print("우린 그것을                                        이라 부르고 있지.", 35, 82)
	SetBlueColor()
	love.graphics.print("일정한 단계를 통해 주어진 문제를 해결하기 위한 절차나 방법", 155, 112)
	SetBlackColor()
	love.graphics.print("그것을 풀기 위해서는", 35, 112)
	love.graphics.print("이 필요하단다!", 489, 112)
	love.graphics.print("마왕은 수 십, 수 백 가지의 문제를 알고 있단다.", 35, 132)
	love.graphics.print("하지만 그 절차나 방법만 깨닫는다면 문제를 푸는데 어려움은 없을 것이야!", 35, 152)
	--[[
	하지만 성에 도착한다고 해서 끝이 아니다!
	우선 마왕의 성을 도착하면 마왕이 내는 문제를 풀어야 한단다.
	우린 그것을 마왕의 문제, '알고리즘'이라 부르고 있지.
	그것을 풀기 위해서는 일정(유한)한 단계를 통해 주어진 문제를 해결하기 위한 절차나 방법이 필요하단다!
	하지만 그 절차나 방법만 깨닫는다면 문제를 푸는데 어려움은 없을 것이야!
	]]--
end

function AfterElderTalk4()
 	love.graphics.print("하지만 이 마스크만 있다고", 365, 32)
 	love.graphics.print("해서 마왕을 무찌르기는", 365, 52)
 	love.graphics.print("쉽지 않을거야. ", 365, 72)
 	love.graphics.print("내가 설명해주는 것을 잘", 365, 102)
 	love.graphics.print("듣거라!", 365, 122)
end

function AfterElderTalk3()
 	love.graphics.print("수 있는 물건을 개발했단다!", 365, 32)
 	love.graphics.print("그 처음으로 만든 것이 니가", 365, 52)
 	SetBlueColor()
 	love.graphics.print("마스크", 392, 72)
 	SetBlackColor()
 	love.graphics.print("받은          란다.", 365, 72)
 	love.graphics.print("", 365, 92)
end

function AfterElderTalk2()
 	love.graphics.print("이제 때가 됐단다, 알.", 365, 32)
 	love.graphics.print("비로소 지금에야 말로 마왕", 365, 52)
 	love.graphics.print("을 무찌를 기회가 왔단다!", 365, 72)
 	love.graphics.print("우리가 마왕에 대한 오랜", 365, 92)
 	love.graphics.print("연구 끝에 마왕에 대항할", 365, 112)
end

function AfterWarroirTalkAtVillage1()
 	love.graphics.print("네 장로님.", 115, 32)
 	--love.graphics.print("안녕하세요?", 115, 52)
end

function AfterElderTalk1()
 	love.graphics.print("그래 알, 잘 다녀왔니?", 365, 32)
 	--love.graphics.print("종이를 기억하니??", 365, 52)
end

function BlacksmtihTalk1()
 	love.graphics.print("잘 지냈냐 알!", 355, 26)
 	love.graphics.print("장로님께서 맡겨놓으신", 355, 46)
 	SetBlueColor()
 	love.graphics.print("마스크", 355, 66)
 	SetBlackColor()
 	love.graphics.print("는 완성됐다!", 390, 66)
 	love.graphics.print("들어보니 마왕이 첫번째로", 355, 86)
 	love.graphics.print("사는 성에서는 모래바람이", 355, 106)
end

function BlacksmtihTalk2()
 	love.graphics.print("굉장히 강하게 분다고 하구", 355, 26)
 	love.graphics.print("나! 이 마스크를 쓰고 꼭", 355, 46)
 	love.graphics.print("마왕을 무찔러다오!", 355, 66)
end

function BlacksmtihTalk3()
 	love.graphics.print("아참! 니가 가지고 있는", 355, 26)
 	love.graphics.print("물건들은 이 대장간의 문 ", 355, 46)
 	love.graphics.print("앞에서  '↑'키를 누르면", 355, 66)
 	love.graphics.print("확인 가능하단다!", 355, 86)
end


function ElderTalkAtHome1()
	love.graphics.print("그 종이는 바로", 365, 32)
	SetBlueColor()
	love.graphics.print("'기억의 두루", 450, 32)
	love.graphics.print("마리'", 365, 52)
	SetBlackColor()
	love.graphics.print("란다.", 395, 52)
 	love.graphics.print("너의 집에서는 그 종이를 이", 365, 82)
 	love.graphics.print("용하여 지금까지 했던 모험", 365, 102)
 	love.graphics.print("에 대한 기록이 가능하단다!", 365, 122)
end

function ElderTalkAtHome2()
	love.graphics.print("기록하는 것 이외에도 다른", 365, 32)
 	love.graphics.print("중요한 요소들도 설명해주", 365, 52)
 	love.graphics.print("마!", 365, 72)
 	love.graphics.print("자, 이번에는 바로 앞에 있는", 365, 102)
 	SetBlueColor()
 	love.graphics.print("포탈", 365, 122)
 	SetBlackColor()
 	love.graphics.print("로 이동해보거라!", 387, 122)
end

function ElderTalkAtProtal1()
 	love.graphics.print("이것은 보스가 있는 ", 365, 32)
 	love.graphics.print("각 스테이지로 이동할 ", 365, 52)
 	love.graphics.print("수 있는 중요한", 365, 72)
 	SetBlueColor()
 	love.graphics.print("포탈", 450, 72)
 	SetBlackColor()
 	love.graphics.print("이란다!", 473, 72)
 	love.graphics.print("'↑'키를 눌러서 이동할 수", 365, 102)
 	love.graphics.print("있지!", 365, 122)
end

function ElderTalkAtProtal2()
 	love.graphics.print("그럼 이정도면..", 365, 32)
 	love.graphics.print("아! 그리고 중요한 말을", 365, 62)
 	love.graphics.print("빼먹을뻔 했구나!", 365, 82)
end

function ElderTalkAtProtal3()
 	love.graphics.print("마왕을 무찌르는데 필요한", 365, 32)
 	love.graphics.print("물건을 대장장이에게 맡겨", 365, 52)
 	love.graphics.print("놨으니 빨간 지붕의", 365, 72)
 	love.graphics.print("대장간으로 가서", 365, 92)
 	love.graphics.print("물건을 받아오거라!", 365, 112)
end

function WarriorTalk1()
 	love.graphics.print("장로님!", 115, 32)
 	love.graphics.print("안녕하세요?", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk1()
 	love.graphics.print("오, 알! 어서오거라", 365, 32)
 	love.graphics.print("잘 지내고 있느냐?", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk2()
 	love.graphics.print("네. 장로님 덕분에요!", 115, 32)
end

function ElderTalk2()
 	love.graphics.print("그래. 마침 잘왔구나", 365, 32)
 	love.graphics.print("너에게 할말이 있단다", 365, 52)
end

function WarriorTalk3()
 	love.graphics.print("뭔데요??", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk3()
 	love.graphics.print("음.. 지난번에 내가 줬던 ", 365, 32)
 	SetBlueColor()
 	love.graphics.print("종이", 365, 52)
 	-- 이어서 
 	SetBlackColor()
 	love.graphics.print("를 기억하니??", 389, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk4()
 	love.graphics.print("네?? 음...", 115, 32)
 	love.graphics.print("글쎄요..", 115, 52)
 	love.graphics.print("잘 기억이 나지 않아요.", 115, 72)
end

function ElderTalk4()
 	love.graphics.print("뭐라고!? ", 365, 32)
 	love.graphics.print("그 종이는 굉장히 중요한", 365, 52)
 	love.graphics.print("종이란다!!", 365, 72)
end

function WarriorTalk5()
 	love.graphics.print("무슨 종이인데요 ??", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk5()
	love.graphics.print("그 종이는 니가 앞으로", 365, 32)
	love.graphics.print("헤쳐나갈 모험을 기록할 수", 365, 52)
	love.graphics.print("있는 물건이란다!", 365, 72)

 	love.graphics.print("자! 파란지붕인 너의 집으로", 365, 92)
 	love.graphics.print("가서 찾아보거라", 365, 112)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function SetBlueColor()
	love.graphics.setColor(9,132,247,255)
end

function SetBlackColor()
	love.graphics.setColor(0,0,0,255)
end

function ElderTipImageDraw()
	love.graphics.setColor(255,255,255,255)
	--Tip1, talkCountWithElder6
	if talkCountWithElder == 6 then
		love.graphics.draw(imgMiniCastle, castle_frame,382,7)
		love.graphics.draw(imgMiniStrom, strom_frame,320,75)
		love.graphics.draw(imgPicket, strom_frame,250,135)
	elseif talkCountWithElder == 7 then
		--love.graphics.draw(imgMiniStrom, strom_frame,10,20)
	end

	--Tip2, talkCountWithElder7
end

function TutorialLoad()
	imgMiniStrom = love.graphics.newImage("images/miniStrom.png")
	imgMiniStrom:setFilter("nearest","nearest")

	imgMiniCastle = love.graphics.newImage("images/miniCastle.png")
	imgMiniCastle:setFilter("nearest","nearest")
	
	strom_frame = love.graphics.newQuad(0,0,32,32,32,32)
	castle_frame = love.graphics.newQuad(0,0,64,36,64,36)
end