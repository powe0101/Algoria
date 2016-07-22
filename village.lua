
function createVillage()

  CreateTree(300,54)
  CreateTree(150,54)

  CreateTree(450,54)
  CreateTree(600,54)
  CreateTree(750,54)
  CreateTree(150,54)

  CreateCloud(0,1)
  CreateCloud(100,1)
  CreateCloud(200,1)
  CreateCloud(300,1)
  CreateCloud(400,1)
  CreateCloud(500,1)

  CreateHouse(17,54)
end

function deleteVillage()
DeleteCloud()
DeleteTree()
DeleteHouse()
end