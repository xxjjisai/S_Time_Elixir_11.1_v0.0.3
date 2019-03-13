_G.Scene2 = GameChainSystem:DeriveClass("Scene2");

function Scene2:StartHandler()  

    UIMgr:GetUI("btn_1"):SetAttr("onClick",function () 
        SceneMgr:SetAppointScene(1)
    end) 

end