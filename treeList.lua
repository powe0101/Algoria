function CreateTree(x,y)
	treeList[treeCount] = Tree.create()
	treeList[treeCount]:reset(x,y)
	treeCount = treeCount + 1
end

function TreeListUpdate(dt)
	for i = 0, treeCount-1 do
    treeList[i]:update(dt)
  end
end

function TreeListDraw()
	for i = 0, treeCount-1 do
  	  treeList[i]:draw(dt)
  	end
end