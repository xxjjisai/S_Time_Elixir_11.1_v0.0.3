_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

local ny = 300

local function myStencilFunction()
    love.graphics.rectangle("fill", 225, 200, 350, 300)
end


function Scene1:StartHandler()
    Option.bBackGroundStatic = false;

    love.graphics.stencil(myStencilFunction, "replace", 1)
end

function Scene1:Update(dt)
    ny = ny + 0.1
end

function Scene1:Render()
    love.graphics.stencil(myStencilFunction, "replace", 1)
    love.graphics.setStencilTest("greater", 0)
    love.graphics.setColor(1, 0, 0, 0.45)
    love.graphics.circle("fill", 300, ny, 150, 50)
    love.graphics.setColor(0, 1, 0, 0.45)
    love.graphics.circle("fill", 500, ny, 150, 50)
    love.graphics.setColor(0, 0, 1, 0.45)
    love.graphics.circle("fill", 400, ny + 100, 150, 50)
    love.graphics.setStencilTest()
end

function Scene1:DestoryHandler()

end