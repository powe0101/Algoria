--라이프를 관리하는 메서드

playerDeadCheck = false

lifeCheck = false
playerLife = 5

dead_frame = love.graphics.newQuad(0,0,100,100,100,100)

function UpdateLife()
	if lifeCheck then
		HeartListDelete()
		BheartListDelete()
		LifeControl()
		
		lifeCheck = false
	end
end

function LifeMinus()
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

function PlayerDie() --라이프가 다 닳아서 죽는 부분.
	DeleteVillage()
	AllMakeFalse()
	--플레이어도 사라지게
	--pl = nil
	fadeOn = false
	playerDeadCheck = true --타이틀로 넘어가는 부분에서 다시 false로 만들면 될 듯.
end

function BadEnding()
	--추후에 용사가 죽은 이미지로 변경할 것.
	love.graphics.draw(imgWarrorDead, dead_frame, 300, 60)
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