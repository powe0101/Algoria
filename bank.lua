Bank = {}
Bank.__index = Bank

function Bank.Create()
  self = {}
  setmetatable(self,Bank)
  self:Reset()
  return self
end

function Bank:Reset()
  self:RegisterImage()
  self.x = 160
  self.y = 110
end

function Bank:RegisterImage()
  imgBank = love.graphics.newImage("images/bank.png")
end

function Bank:Draw()
  love.graphics.draw(imgBank, self.x,self.y)
end
