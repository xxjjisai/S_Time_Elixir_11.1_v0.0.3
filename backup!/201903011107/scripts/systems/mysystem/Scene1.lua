_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler()  

    local btn = UIMgr:GetUI("btn_1")
    btn:SetAttr("onClick",function () 
        self:Trace(1,"Scene1:StartHandler")
        SceneMgr:SetAppointScene(2)
    end) 

end