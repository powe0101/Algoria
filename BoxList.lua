boxList = {}
boxCount = 0

function CreateBox(x,y)
  boxList[boxCount] = Box.create()
<<<<<<< HEAD
  boxList[boxCount]:init(x,y)
  boxCount = boxCount + 1
end

function BoxListReset()
  for i = 0 , boxCount-1 do
  boxList[i]:reset()
  end 
end

function BoxListDraw()
	for i = 0, boxCount-1 do
    	boxList[i]:draw()
  	end
end

function BoxListUpdate(dt)
	for i = 0, boxCount-1 do
		boxList[i]:update()
	end
end 
=======
  boxList[boxCount]:reset(x,y)
  boxCount = boxCount + 1
end

function BoxListUpdate(dt)
  for i = 0, boxCount-1 do
    boxList[i]:update(dt)
  end
end 

function DeleteBox()
   for i=0, boxCount-1 do
    boxList[i]=nil
   end
   boxCount=0
end

function BoxListDraw()
  for i = 0 , boxCount-1 do
  boxList[i]:draw(dt)
  end 
end



>>>>>>> refs/remotes/origin/YGY
