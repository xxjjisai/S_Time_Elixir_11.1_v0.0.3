_G.ClickScleSystem = System:DeriveClass("ClickScleSystem");

ClickScleSystem:SetRegisterCompo{
   "ClickScale","Transform"
}

function ClickScleSystem:MouseDown(x, y, button, istouch, presses)
    local iScene = self:GetCurScene();
    for _,tbLayer in pairs(iScene:GetRenderList()) do
        for _,iActor in ipairs(tbLayer) do 
          repeat
            if not self:GetRegisterCompo(iActor) then break end
            if button == 1 then 
                local mx,my = CameraMgr:GetMousePosition();
                local obj1 = {x = iActor:GetiCompo("Transform").x,y = iActor:GetiCompo("Transform").y,w = iActor:GetiCompo("Transform").w,h = iActor:GetiCompo("Transform").h};
                local obj2 = {x = mx,y = my,w = 5,h = 5};
                if hitTestObject(obj1,obj2) then 
                    if not iActor:GetiCompo("ClickScale").bClicked then 
                        iActor:GetiCompo("ClickScale").bClicked = true;
                        Tween(1,iActor:GetiCompo("Transform"),{sx = 2, sy=2},"linear",function ()
                            -- iActor:GetiCompo("ClickScale").bClicked = false;
                        end)
                    end
                end
            end
          until true
        end
    end 
end