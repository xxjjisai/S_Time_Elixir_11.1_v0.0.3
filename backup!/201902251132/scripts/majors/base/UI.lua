_G.UI = Entity:DeriveClass("UI");

function UI:DeriveClass(sClassName)
    local obj = {}; 
    obj.sClassName = sClassName;
    obj.tbListenerList = {};    -- 侦听列表 
    obj.tbiCompoList = {};      -- 组件列表
    obj.nUniqueID = 0;          -- 唯一识别
    obj.sTagType = "UI";     -- 标签类型
    obj.sUseName = "UI";     -- 功能名称
	setmetatable(obj,{__index = self});
	return obj;
end 

function UI:AddiCompo(sClassName,tbParams)
    local iCompo = require("scripts/compos/"..sClassName):New(tbParams); 
    self.tbiCompoList[sClassName] = iCompo;
end

function UI:GetiCompo(sClassName)
    return self.tbiCompoList[sClassName];
end 

function UI:BindCompo(cfg) 
    local cfg = cfg;
    for i,v in pairs(cfg) do 
        self:AddiCompo(i,v);
    end    
end  

function UI:Clear()
    if next(self.tbiCompoList) then
        self.tbiCompoList = {};
    end
end

function UI:ChangeiCompoParam(tbProperty)
    local tbProperty = tbProperty or {};
    if next(tbProperty) then 
        for sComp,tbPro in pairs(tbProperty) do
            if not self:GetiCompo(sComp) then 
                self:AddiCompo(sComp,tbPro)
            end 
            for k,v in pairs(tbPro) do
                self:GetiCompo(sComp)[k] = v;
            end  
        end
    end
end