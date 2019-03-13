_G.UserInterfaceSystem = System:DeriveClass("UserInterfaceSystem");

function UserInterfaceSystem:Start()
    local iScene = self:GetCurScene();
    local ui_btn_showui = iScene:GetUIByUseName("ui_btn_showui");
    ui_btn_showui:fClick = function ()
        self:Trace(1,"ui_btn_showui Click!!!!");
    end
end

function UserInterfaceSystem:Update(dt)
    UIMgr:Update(dt);
end

function UserInterfaceSystem:Render() 
    UIMgr:Render(function ()
        -- 比UI显示层级更高的
    end);
end

function UserInterfaceSystem:MouseDown(x, y, button, istouch, presses)   
    UIMgr:MouseDown(x, y, button, istouch, presses);
end

function UserInterfaceSystem:MouseUp(x, y, button, istouch, presses)  
    UIMgr:MouseUp(x, y, button, istouch, presses);
end

function UserInterfaceSystem:MouseMoved(x, y, dx, dy, istouch)
    UIMgr:MouseMoved(x, y, dx, dy, istouch);
end

function UserInterfaceSystem:KeyBoardDown(key, scancode, isrepeat) 
    UIMgr:KeyBoardDown(key, scancode, isrepeat) ;
end

function UserInterfaceSystem:KeyBoardUp(key, scancode)
    UIMgr:KeyBoardUp(key, scancode);
end

function UserInterfaceSystem:WheelMoved(x, y)
    UIMgr:WheelMoved(x, y);
end

function UserInterfaceSystem:TextInput(text)
    UIMgr:TextInput(text);
end