boxCount = 0
boxList = {}
function CreateBox(x,y)
  boxList[boxCount] = Box.create()
  boxList[boxCount]:reset(x,y)
  boxList[boxCount]:CreateDirectionBox(boxList[boxCount].directionBox)
  boxCount = boxCount + 1
end


--FindCollision is Find Box for player
--Using boxList for Side Box 
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
      collision_Top_Y = boxList[i].dtBox[7]
      return true
    end
  end
  collision_Top_Y = 0
  return false
end

function FindCollisionBottomDirection()
  for i =0, boxCount-1 do
    if boxList[i].isCollisionBottom then
      collision_Bottom_Y = boxList[i].dtBox[5]
      return true
    end
  end
  collision_Bottom_Y = 0
  return false 
end

function BoxListUpdate(dt)
  for i = 0, boxCount-1 do
    boxList[i]:update(dt)
  end
end 

function BoxListDelete()
   for i=0, boxCount-1 do
    boxList[i]=nil
   end
   boxCount=0
end

function BoxListDraw()
	for i = 0, boxCount-1 do
    	boxList[i]:draw(dt)
  	end
end

