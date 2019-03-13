_G.UIMgr = Class:DeriveClass("UIMgr"); 

UIMgr.iCurScene = nil;

function UIMgr:SetCurScene(iScne)
    self.iCurScene = iScne;
end

function UIMgr:CreateUI(sUIType,sUseName)
    local sUIPath = string.format("scripts/uis/%s/%s",sUIType,sUIType);
    local sUICfgPath = string.format("scripts/uis/%s/%sConfig",sUIType,sUIType);
    local iUI = require(sUIPath):Create(sUIType..Origin:SetUniqueID());
    iUI.sTagType = sUIType;
    iUI.sUseName = sUseName;
    local CfgUI =  require(sUICfgPath);
    iUI:BindCompo(CfgUI);
    if self.iCurScene then 
        self.iCurScene:AddUI(iUI);
    end
    return iUI
end

function UIMgr:ClearUI()
    if self.iCurScene then 
        self.iCurScene:ClearUI();
    end
end

function UIMgr:RemoveUI(iUI)
    if not self.iCurScene then 
        return   
    end
    self.iCurScene:RemoveUI(iUI);
end


function UIMgr:Update(dt)
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.Update then 
            iUI.Update(dt);
        end
    end
end

function UIMgr:Render(pfn) 
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.Render then 
            iUI.Render();
        end
    end
end

function UIMgr:MouseDown(x, y, button, istouch, presses)   
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.MouseDown then 
            iUI.MouseDown(x, y, button, istouch, presses)
        end
    end
end

function UIMgr:MouseUp(x, y, button, istouch, presses)  
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.MouseUp then 
            iUI.MouseUp(x, y, button, istouch, presses);
        end
    end
end

function UIMgr:MouseMoved(x, y, dx, dy, istouch)
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.MouseMoved then 
            iUI.MouseMoved(x, y, dx, dy, istouch);
        end
    end
end

function UIMgr:KeyBoardDown(key, scancode, isrepeat) 
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.KeyBoardDown then 
            iUI.KeyBoardDown(key, scancode, isrepeat);
        end
    end
end

function UIMgr:KeyBoardUp(key, scancode)
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.KeyBoardUp then 
            iUI.KeyBoardUp(key, scancode);
        end
    end
end

function UIMgr:WheelMoved(x, y)
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.WheelMoved then 
            iUI.WheelMoved(x, y);
        end
    end
end

function UIMgr:TextInput(text)
    if not self.iCurScene then 
        return   
    end
    local tbUIs = self.iCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIs) do 
        if iUI.TextInput then 
            iUI.TextInput(text);
        end
    end
end