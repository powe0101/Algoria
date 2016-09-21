-- Made : 2016/08/10 - G // 최초 수정일
-- Modify :
-- Name : DustWind.lua

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
