-- 0810. 현식 추가.
-- 최종 보스가 아니라 각 스테이지 별로 있는 중간보스에 관련된 파일임.

function CreateBossCastle()
	love.graphics.setBackgroundColor(128,128,128,255)
	PlayAudio("audio/Overworld.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복

    pl:reset()

    CreateGround(-49,0) --이미지를 다시 조정하던지 보스성에서만 용사 y좌표를 바꾸던지 해야할 듯. 0811. 퇴근.
  	CreateGround(481,0)

  	CreatePortal(560,113)
  	CreateBoss(500,21)
end

function CheckBossCastle()
	if love.keyboard.isDown('up') then
		if stageLevel == 2 and castleList[0].x +80 < pl:GetX() and pl:GetX() < castleList[0].x +140 and canPass then --가을에서 보스성 이동하기.
			stageLevel = 6 --가을 보스스테이 레벨은 7.
			DeleteStage()
			CreateBossCastle()
		    HEIGHT=200
    		updateScale()
		end
	    if stageLevel == 3 and 43 < pl:GetX() and pl:GetX() < 56 then --가을에서 보스성 이동하기.
			stageLevel = 7 --가을 보스스테이 레벨은 7.
			DeleteStage()
			CreateBossCastle()
		end
		if stageLevel == 4 and castleList[0].x +80 < pl:GetX() and pl:GetX() < castleList[0].x +140 and canPass then --가을에서 보스성 이동하기.
			stageLevel = 7 --가을 보스스테이 레벨은 7.
			DeleteStage()
			CreateBossCastle()
		    HEIGHT=200
    		updateScale()
		end
	end
end