_G.UIMgr = Class:DeriveClass("UIMgr");

UIMgr.sFocusName = nil;

function UIMgr:CreateUI(sUIType,sUseName,tbProperty)
    local sUIPath = string.format("scripts/uis/%s/%s",sUIType,sUIType);
    local sUICfgPath = string.format("scripts/uis/%s/%sConfig",sUIType,sUIType);
    local sClassName = sUIType..Origin:SetUniqueID();
    local iUI = require(sUIPath):Create(sClassName);
    iUI.sTagType = sUIType;
    iUI.sUseName = sUseName or sClassName;
    local tbCfgUI = clone(require(sUICfgPath));
    local tbProperty = tbProperty or {}
    if next(tbProperty) then 
        for k,v in pairs(tbProperty) do 
            tbCfgUI[k] = clone(v);
        end
    end
    iUI:SetAttribute(clone(tbCfgUI)); 
    SceneMgr:GetCurScene():AddUI(iUI);
    return iUI
end

function UIMgr:GetUI(sUseName)
    return SceneMgr:GetCurScene():GetUI(sUseName);
end

function UIMgr:RemoveUI(sUseName)
    SceneMgr:GetCurScene():RemoveUI(sUseName);
end

function UIMgr:SetInputFocus(sFocusName)
    self.sFocusName = sFocusName;
end

function UIMgr:GetInputFocus()
    return self.sFocusName;
end