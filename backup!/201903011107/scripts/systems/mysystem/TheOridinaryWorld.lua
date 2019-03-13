_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler() 

    self.btn_1 = UIMgr:GetUI("btn_1");
    
    self.btn_1:SetAttr("onHover",function () 
        self.btn_1:SetAttr("sName",tostring(self.btn_1:GetAttr("bEnabled")));
    end)

    self.btn_1:SetAttr("onClick",function () 
        self.btn_1:SetAttr("bEnabled",false)
        if self.btn_1:GetAttr("y") > 100 then 
            self:Process_1();
        else 
            self:Process_2();
        end
    end)

end 

function TheOridinaryWorld:Process_1()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();
    -- 当前系统

    -- 创建链条 
    self:CreateChain(1,function(pfn) 
        Tween(5,self.btn_1:GetAttribute(),
            { y = 100 },'linear',function () 
            self.btn_1:SetAttr("y",100);
            if pfn then pfn() end
        end)
    end);
 
    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self.btn_1:SetAttr("bEnabled",true)
        end);
    end);

end

function TheOridinaryWorld:Process_2()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();
    -- 当前系统

    -- 创建链条 
    self:CreateChain(1,function(pfn) 
        Tween(5,self.btn_1:GetAttribute(),
            { y = 470 },'linear',function () 
            self.btn_1:SetAttr("y",470);
            if pfn then pfn() end
        end)
    end);
 
    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self.btn_1:SetAttr("bEnabled",true)
        end);
    end);

end

function TheOridinaryWorld:DestoryHandler()
    Camera.scale = 1;
    self.btn_1 = nil;
end