function CreateFall()
	CreateTree(150,54)
end

function DeleteVillage()
  --DeleteTree()
end

function CheckPortal() --0725 포탈같이 일정 좌표에서 ↑키를 누르면 장소가 이동되도록 해봄. by.현식
  -- body
  if love.keyboard.isDown('up') then
    if 40 < pl:GetX() and pl:GetX() < 47 then --0722 스테이지 변경을 위한 테스트 진행중.. by.현식
      deleteVillage()
      startStage = 1
      CreateFall()
    end
  end
end