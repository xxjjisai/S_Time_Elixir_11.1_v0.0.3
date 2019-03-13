_G.Scene2 = GameChainSystem:DeriveClass("Scene2");

function Scene2:StartHandler()  
    self.btn_1 = UIMgr:GetUI("btn_1");  
    self.btn_1:SetAttr("onClick",function () 
        self:Trace(1," Scene2:StartHandler onClick ")
        SceneMgr:SetAppointScene(1)
    end)

end  

function Scene2:DestoryHandler()
    Camera.scale = 1;
    self.btn_1 = nil;
end