boxList = {}

function CreateBox(x,y)
  boxList[BOX_COUNT] = Box.create()
  boxList[BOX_COUNT]:init(x,y)
  BOX_COUNT = BOX_COUNT + 1
end

function BoxListReset()
  for i = 0 , BOX_COUNT-1 do
  boxList[i]:reset()
  end 
end

function BoxListDraw()
	for i = 0, BOX_COUNT-1 do
    	boxList[i]:draw()
  	end
end

function BoxListUpdate()
	for i = 0, BOX_COUNT-1 do
		boxList[i]:update()
	end
end 