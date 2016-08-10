-- 0810. 현식 추가. 
-- 최종 보스가 아니라 각 스테이지 별로 있는 중간보스에 관련된 파일임.

function CheckBossCastle()
	if stageLevel == 3 then
		if love.keyboard.isDown('up') then
			if 50 < pl:GetX() and pl:GetX() < 58 then
				DeleteVillage()
				CreateVillage()
			end
		end
	end
end