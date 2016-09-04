--라이프를 관리하는 메서드

lifeCheck = false
playerLife = 5

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
	if 0 < playerLife then
		playerLife = playerLife -1
	--else 
		--여기서는 게임 종료를 구현해야함.
	end
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