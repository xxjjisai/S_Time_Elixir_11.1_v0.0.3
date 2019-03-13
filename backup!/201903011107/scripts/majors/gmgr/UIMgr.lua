_G.UIMgr = Class:DeriveClass("UIMgr");

function UIMgr:CreateUI(sUIType,sUseName,tbAttribute)
    local sUIPath = string.format("scripts/uis/%s/%s",sUIType,sUIType);
    local sUICfgPath = string.format("scripts/uis/%s/%sConfig",sUIType,sUIType);
    local sClassName = sUIType..Origin:SetUniqueID(); 
    local iUI = require(sUIPath):Create(sClassName);
    iUI.sTagType = sUIType;
    iUI.sUseName = sUseName;
    local tbCfgUI = clone(require(sUICfgPath));
    local tbAttribute = tbAttribute or {}
    if next(tbAttribute) then 
        for k,v in pairs(tbAttribute) do 
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