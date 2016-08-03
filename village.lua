function createVillage()
  CreateGround(-49,76) --마을에서의 땅과 스테이지에서의 땅은 다르기 때문에 얘도 생성방식으로 해야할 듯. by.현식 0727
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

  CreateHouse(17,54)
  CreateHouse(450, 54)

  CreatePortal(300,113) -- 0725 마을 집 문 앞에 만들어놓은 포탈은 세이브/로드 팝업을 띄우도록 추후에 수정해야함. by.현식

  CreateBox(300,50)
  CreateBox(400,166)

  CreateBox(600,130)
  CreateBox(350,100)
end

function deleteVillage()
  CloudListDelete()
  TreeListDelete()
  HouseListDelete()
  GroundListDelete()
end