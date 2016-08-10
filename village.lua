function createVillage()
  LifeFive() --최초에 게임이 시작될때 라이프가 5개로 띄워지도록. 마을이 최초로 띄어지므로 여기에 생성함.
  
  CreateGround(-49,76) 
  CreateGround(541,76)

  CreateTree(150,54)
  --CreateTree(300,54)

  --CreateTree(450,54)
  CreateTree(600,54)
  CreateTree(750,54)

  CreateCloud(0,1)
  CreateCloud(100,1)
  CreateCloud(500,1)
  CreateCloud(200,1)
  CreateCloud(300,1)
  CreateCloud(400,1)

  CreateHouse(17,108)
  CreateChiefHouse(380,77)
  CreateBlackSmithHouse(550,108)

  CreatePortal(300,113) -- 0725 마을 집 문 앞에 만들어놓은 포탈은 세이브/로드 팝업을 띄우도록 추후에 수정해야함. by.현식
  CreateBox(200,155)
end

function deleteVillage()
  CloudListDelete()
  TreeListDelete()
  HouseListDelete()
  ChiefHouseListDelete()
  GroundListDelete()
  BoxListDelete()
end