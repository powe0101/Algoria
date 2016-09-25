-- Made : 2016/09/25
-- Modify :
-- Name :

function CreateFinal()
	-- 겨울까지 클리어 후 특정 조건 만족시 발생
	stageLevel = 9
  --updateScale()

	--[[ 겨울 스테이지까지 클리어하면 마왕을 봉인했다고 생각했으나
	마왕은 자신의 진정한 힘을 각성하여 자신의 성을 마을에 떨어뜨려
	마을을 폐허로 만든다 그 후 용사와 마왕의 최후의 결전
	]]
	--[[
	1. 마왕성이 떨어지는 장면을 이미지로 만드는 방식
	2. 마왕성을 직접 y좌표가 점점 감소하게 만드는 방식
	]]

	-- 마왕성 생성
	fCastle = FinalCastle.create()
	fCastle:reset(180, -160)

	-- 암전 1 + 음악 바뀜
	PlayAudio("audio/FinalBattleOfTheDarkWizards.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
	notice = Notice.Create()
	notice:SetText("마지막 스테이지")

  pl:reset()

	-- 암전 2 + 마왕성착지, 마을 폐허화
	CreateGround(-49,76)
	CreateGround(541,76)
	CreateBackGround(-50,0)
	CreateBackGround(240,0)
	CreateBackGround(530,0)
	CreateBackGround(820,0)

	CreateTree(-50,80)
	CreateTree(150,80)
	CreateTree(580,80)
	CreateTree(800,80)

	CreateHouse(17,108)
	CreateChiefHouse(480,77)
  CreateFinalPortal(298, 130)
end

--[[
function CreateFinal()
  --stageLevel = 9 -- 최종 보스 스테이지 레벨 9
  love.graphics.setBackgroundColor(128,128,128,255)
	PlayAudio("audio/Overworld.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복

    pl:reset()

  CreateGround(-49,0)
	CreateGround(481,0)

	CreatePortal(535,113)
  CreateBoss(500,21)
end
]]
