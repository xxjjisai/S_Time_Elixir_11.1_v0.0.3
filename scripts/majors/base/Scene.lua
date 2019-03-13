_G.Scene = Class:DeriveClass("Scene");

function Scene:DeriveClass(sClassName)
    local obj = {};
    obj.sClassName = sClassName;
    obj.tbListenerList = {};                -- 侦听列表 
    obj.tbActorList = {};                   -- 演员列表
    obj.tbRenderList = {};                  -- 渲染列表
    obj.tbSystemList = {};                  -- 系统列表
    obj.tbUIList = {};                      -- UI列表
    obj.nUniqueID = 0;                      -- 唯一识别
    obj.sTagType = "Scene";                 -- 标签类型
    obj.nSceneID = 0;                       -- 场景ID
	setmetatable(obj,{__index = self});
	return obj;
end

function Scene:AddActor(iActor)
    table.insert(self.tbActorList,iActor);
    if not iActor:GetiCompo("RenderLayer") then return end;
    local nLayerIndex = iActor:GetiCompo("RenderLayer").nLayerIndex;
    self.tbRenderList = self.tbRenderList or {};
    self.tbRenderList[nLayerIndex] = self.tbRenderList[nLayerIndex] or {};
    table.insert(self.tbRenderList[nLayerIndex], iActor);
end

function Scene:RemoveActor(iActor)
    for i,v in ipairs(self.tbActorList) do 
        if v.sClassName == iActor.sClassName then 
            table.remove(self.tbActorList,i);
            break;
        end 
    end
    if not iActor:GetiCompo("RenderLayer") then return end;
    local nLayerIndex = iActor:GetiCompo("RenderLayer").nLayerIndex;
    for i,v in ipairs(self.tbRenderList[nLayerIndex]) do 
        if v.sClassName == iActor.sClassName then 
            table.remove(self.tbRenderList[nLayerIndex],i);
            break;
        end
    end 
end

function Scene:GetActorList()
    return self.tbActorList;
end

function Scene:GetRenderList()
    return self.tbRenderList;
end

function Scene:RegisterSystem(iSystem)
    for i,v in ipairs(self.tbSystemList) do 
        if v.sClassName == iSystem.sClassName then 
            return 
        end
    end 
    table.insert(self.tbSystemList,iSystem);
end

function Scene:GetSystemList()
    return self.tbSystemList;
end

function Scene:GetSystemByName(sClassName)
    for i,v in ipairs(self.tbSystemList) do 
        if v.sClassName == sClassName then 
            return v
        end
    end
end

function Scene:GetActorByTagType(sTagType)
    for _,iActor in ipairs (self.tbActorList) do 
        if iActor.sTagType == sTagType then 
            return iActor;
        end
    end 
end

function Scene:GetActorByClassName(sClassName)
    for _,iActor in ipairs (self.tbActorList) do 
        if iActor.sClassName == sClassName then 
            return iActor;
        end
    end 
end

function Scene:GetActorByUseName(sUseName)
    for _,iActor in ipairs (self.tbActorList) do 
        if iActor.sUseName == sUseName then 
            return iActor;
        end
    end 
end

function Scene:UninstallActor()
    self.tbActorList = {};
    self.tbRenderList = {};
    self.tbUIList = {};
end

function Scene:UninstallSystem()
    self.tbSystemList = {};
end

function Scene:GetPlayer(nIndex)
    if nIndex == nil then nIndex = 1 end
    local tbPlayerList = {};
    for _,iActor in ipairs (self.tbActorList) do 
        if iActor.sTagType == "Player" then 
            table.insert(tbPlayerList, iActor);
        end
    end 
    local iActor = nil;
    if nIndex > #tbPlayerList then 
        nIndex = 1;
        iActor = tbPlayerList[nIndex]
        return iActor,nIndex
    end 
    iActor = tbPlayerList[nIndex]
    return iActor,nIndex;
end

function Scene:AddUI(iUI)
    table.insert(self.tbUIList,iUI)
end 

function Scene:GetAllUI()
    return self.tbUIList;
end

function Scene:GetUI(sUseName)
    for i,iUI in ipairs(self.tbUIList) do  
        if iUI.sUseName == sUseName then 
            return iUI;
        end
    end
end

function Scene:RemoveUI(sUseName)
    local targetUIIndex = nil;
    for i,iUI in ipairs(self.tbUIList) do 
        if iUI.sUseName == sUseName then 
            targetUIIndex = i;
            break;
        end
    end
    if targetUIIndex then 
        table.remove(self.tbUIList,targetUIIndex);
    end
end

function Scene:ClearUI()
    self.tbUIList = {};
end