-- 0810. 현식 추가.
-- 최종 보스가 아니라 각 스테이지 별로 있는 중간보스에 관련된 파일임.

function CreateBossCastle()
	stageLevel = 7 --챕터별 보스 스테이지. 파이널은 6으로.
	love.graphics.setBackgroundColor(128,128,128,255)

    pl:reset()

    CreateGround(-49,0) --이미지를 다시 조정하던지 보스성에서만 용사 y좌표를 바꾸던지 해야할 듯. 0811. 퇴근.
  	CreateGround(481,0)

  	CreateBoss(500,21)
end

function CheckBossCastle()
	if love.keyboard.isDown('up') then
		if stageLevel == 3 and 43 < pl:GetX() and pl:GetX() < 56 then --가을에서 보스성 이동하기.
			stageLevel = 7 --가을 보스스테이 레벨은 7.
			DeleteVillage()
			CreateBossCastle()
		end
	end
end
