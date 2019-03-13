_G.MouseMoveSystem = System:DeriveClass("MouseMoveSystem");

function MouseMoveSystem:Start()
    
end
 
function MouseMoveSystem:Update(dt)
    if love.mouse.isDown(1) then 
        local mx = love.mouse.getX();
        local my = love.mouse.getY();
        local iScene = self:GetCurScene();
        local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
        local iPlayer = iScene:GetPlayer(1);
        local w = iPlayer:GetiCompo("Size").w;
        local h = iPlayer:GetiCompo("Size").h;
        local obj1 = {
            x = mx;
            y = my;
            w = 5;
            h = 5;
        }
        local obj2 = {
            x = iPlayer:GetiCompo("Position").x;
            y = iPlayer:GetiCompo("Position").y;
            w = w;
            h = h;
        }
        if hitTestObject(obj1,obj2) then 
            local w = iPlayer:GetiCompo("Size").w;
            local h = iPlayer:GetiCompo("Size").h;
            iPlayer:GetiCompo("Position").x = mx-w/2;
            iPlayer:GetiCompo("Position").y = my-h/2;
        end
    end 
end

function MouseMoveSystem:Render() 
    
end