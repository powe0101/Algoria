Tree = {}
Tree.__index = Tree

tree_frame = love.graphics.newQuad(0,0,108,212,64,128)

function Tree.create()
	local self = {}
	setmetatable(self, Tree)
	self:reset()
	return self
end

function Tree:reset(x,y)
	self.x = x
	self.y = y
	self.onGround = true
end

function Tree:update()

end
function Tree:draw()
	love.graphics.draw(imgTree,tree_frame,self.x,self.y)
end