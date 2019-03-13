
_G.ContentMgr = Class:DeriveClass("ContentMgr");

function ContentMgr:ProduceHandler(iScene,fCallback)
    local cfg = _G["Scene_"..iScene.nSceneID];
    for _,tbActor in ipairs(cfg.tbActor) do 
        local iActor = ActorMgr:CreateActor(tbActor.sActorType);
        iScene:AddActor(iActor);
        iActor:ChangeiCompoParam(tbActor.tbProperty);
    end 
    if cfg.tbUI then 
        for _,tbUI in ipairs(cfg.tbUI) do 
            local iUI = UIMgr:CreateUI(tbUI.sUIType,tbUI.sUseName);
            iScene:AddUI(iUI);
            iUI:ChangeiCompoParam(tbUI.tbProperty);
        end 
    end
    for _,sSystemName in ipairs(cfg.tbSystem) do 
        iScene:RegisterSystem(_G[sSystemName]);
    end
    if fCallback then fCallback(); end 
end

function ContentMgr:UninstallHandler(iScene,fCallback)
    local tbSystemList = iScene:GetSystemList();
    for _,iSystem in ipairs(tbSystemList) do 
        if iSystem.Destory then 
            iSystem:Destory();
        end
    end
    iScene:UninstallActor();
    iScene:UninstallSystem();
    if fCallback then fCallback(); end 
end