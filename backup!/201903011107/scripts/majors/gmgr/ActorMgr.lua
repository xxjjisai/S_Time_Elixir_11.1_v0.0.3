_G.ActorMgr = Class:DeriveClass("ActorMgr"); 

function ActorMgr:CreateActor(sActorType,sUseName)
    local sActorPath = string.format("scripts/actors/%s/%s",sActorType,sActorType);
    local sActorCfgPath = string.format("scripts/actors/%s/%sConfig",sActorType,sActorType);
    local sActorClassName = sActorType..Origin:SetUniqueID();
    local iActor = require(sActorPath):Create(sActorClassName);
    iActor.sTagType = sActorType;
    iActor.sUseName = sUseName or sActorClassName;
    local CfgActor =  require(sActorCfgPath);
    iActor:BindCompo(CfgActor);
    return iActor
end

function ActorMgr:GetActor(sUseName)
    return SceneMgr:GetCurScene():GetActorByUseName(sUseName);
end 

function ActorMgr:RemoveActor(iActor)
    SceneMgr:GetCurScene():RemoveActor(iActor);
end