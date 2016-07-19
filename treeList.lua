function CreateTree(x,y)
	treeList[treeCount] = Tree.create()
	treeList[treeCount]:reset(x,y)
	treeCount = treeCount + 1
end