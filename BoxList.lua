boxCount = 0
boxList = {}
function CreateBox(x,y)
  boxList[boxCount] = Box.create()
  boxList[boxCount]:init(x,y)
  boxList[boxCount]:CreateDirectionBox(boxList[boxCount].directionBox)
  boxCount = boxCount + 1
end

function FindCollisionRightDirection()
  for i =0, boxCount-1 do
    if boxList[i].isCollisionLeft then
      isCanMoveRight = false
      return 
    end
  end

  isCanMoveRight = true
end

function FindCollisionLeftDirection()
  for i =0, boxCount-1 do
    if boxList[i].isCollisionRight then
      isCanMoveLeft = false
      return 
    end
  end

  isCanMoveLeft = true
end

function FindCollisionTopDirection()
  for i =0, boxCount-1 do
    if boxList[i].isCollisionTop then
      
      return 
    end
  end

end

function FindCollisionBottomDirection()
  for i =0, boxCount-1 do
    if boxList[i].isCollisionTop then
      isCanJump = false
      return 
    end
  end

  isCanJump = true
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