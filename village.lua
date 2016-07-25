function createVillage()
  CreateTree(300,54)
  CreateTree(150,54)

  CreateTree(450,54)
  CreateTree(600,54)
  CreateTree(750,54)
  CreateTree(150,54)

  CreateCloud(0,1)
  CreateCloud(100,1)
  CreateCloud(500,1)
  CreateCloud(200,1)
  CreateCloud(300,1)
  CreateCloud(400,1)

  CreateHouse(17,54)

  CreatePortal(300,120) -- 0725 마을 집 문 앞에 만들어놓은 포탈은 세이브/로드 팝업을 띄우도록 추후에 수정해야함. by.현식
end

function deleteVillage()
  DeleteCloud()
  DeleteTree()
  DeleteHouse()
  DeletePortal()
end