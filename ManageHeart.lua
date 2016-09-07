--라이프를 관리하는 메서드

playerDeadCheck = false
reTitleCheck = false

lifeCheck = false
playerLife = 5

dead_frame = love.graphics.newQuad(0,0,64,64,64,64)

function BadEndingContorl()
	if playerDeadCheck then
		if love.keyboard.isDown('space') then
			SetGoyangFont()
			stageLevel = -1
			playerDeadCheck = false
			splash = false
			reTitleCheck = true
			TitleRun()
		end
	end 
end

function UpdateLife()
	if lifeCheck then
		HeartListDelete()
		BheartListDelete()
		LifeControl()
		
		lifeCheck = false
	end
end

function LifeMinus()
	--가시일때 조건문을 줘서 막으면 됨.
	TurnOnFadeOut()
	lifeCheck = true --라이프를 닳게하기 위해
	if 1 < playerLife and playerLife < 6 then
		playerLife = playerLife -1
	else
		--라이프 0, 게임종료. 게임종료 때 띄워주는 이미지를 간단히 만드는 것도 나쁘지 않을 듯.
		playerLife = playerLife -1
		PlayerDie()
	end
end

function LifeMinusAtCreeper()
	lifeCheck = true --라이프를 닳게하기 위해
	if 1 < playerLife and playerLife < 6 then
		playerLife = playerLife -1
	else
		--라이프 0, 게임종료. 게임종료 때 띄워주는 이미지를 간단히 만드는 것도 나쁘지 않을 듯.
		playerLife = playerLife -1
		PlayerDie()
	end
end

function InitLife()
	if playerLife == 5 then
    	LifeFive() --최초에 게임이 시작될때 라이프가 5개로 띄워지도록. 단, 다른 스테이지 갔다가 라이프가 5개 밑일 경우 실행되지 않도록.
  	elseif playerLife == 0 then
    	HeartListDelete()
    	BheartListDelete()
    	playerLife = 5
    	LifeFive()  
  	end
end


function PlayerDie() --라이프가 다 닳아서 죽는 부분.
	love.graphics.setBackgroundColor(255,255,255,255)
	DeleteStage()
	AllMakeFalse()
	--SetBadEndingFont()

	if stageLevel == 2 or stageLevel == 4 then
		--여름/겨울의 경우 사이즈 재배치 후 종료.
		WIDTH = 600
		HEIGHT = 200
		updateScale()
	end

	--플레이어도 사라지게
	--if 0 < stageLevel and stageLevel < 5 then
		pl = nil
	
	fadeOn = false
	playerDeadCheck = true --타이틀로 넘어가는 부분에서 다시 false로 만들면 될 듯.

	--배드엔딩곡 필요
	--기존 플레이어 없애고 우는 모습의 플레이어 필요.
	--게임오버라고 써줄 것.
	--엔터치면 타이틀로 넘어갈 수 있도록.
end

function BadEnding()
	--추후에 용사가 죽은 이미지로 변경할 것.
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("Game Over", 200,30)
	love.graphics.print("다시 시작하려면 'Space'키를 누르세요.",70
		,155)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(imgWarrorDead, dead_frame, 250, 60)
end

function LifeControl()
	if playerLife == 5 then
		LifeFive() --최초 1회 실행해야할 필요가 있음. Village에서 실행시킴.
	elseif playerLife ==4 then
		LifeFour()
	elseif playerLife == 3 then
		LifeThree()
	elseif playerLife == 2 then
		LifeTwo()
	elseif playerLife == 1 then
		LifeOne()
	elseif playerLife == 0 then
		LifeZero() --라이프가 0이므로 게임종료시켜야함.
	end
end

function LifeFive()
	CreateHeart(480,2)
    CreateHeart(500,2)
    CreateHeart(520,2)
    CreateHeart(540,2)
    CreateHeart(560,2)
end

function LifeFour()
	CreateHeart(480,2)
    CreateHeart(500,2)
    CreateHeart(520,2)
    CreateHeart(540,2)
    CreateBheart(560,2)
end

function LifeThree()
	CreateHeart(480,2)
    CreateHeart(500,2)
    CreateHeart(520,2)
    CreateBheart(540,2)
    CreateBheart(560,2)
end

function LifeTwo()
	CreateHeart(480,2)
    CreateHeart(500,2)
    CreateBheart(520,2)
    CreateBheart(540,2)
    CreateBheart(560,2)
end

function LifeOne()
	CreateHeart(480,2)
    CreateBheart(500,2)
    CreateBheart(520,2)
    CreateBheart(540,2)
    CreateBheart(560,2)
end

function LifeZero() --게임오버의 이펙트를 새로 구현해야 할 듯.
	CreateBheart(480,2)
    CreateBheart(500,2)
    CreateBheart(520,2)
    CreateBheart(540,2)
    CreateBheart(560,2)
end