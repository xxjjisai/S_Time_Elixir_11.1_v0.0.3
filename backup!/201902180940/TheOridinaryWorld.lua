_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler()
    self:Init(function ()
        self:Process_1();
    end)
end

function TheOridinaryWorld:Init(pfn) 
    Camera.scale = 1;

    if pfn then pfn() end
end

function TheOridinaryWorld:Process_1()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();
    -- 创建链条 
    self:CreateChain(3,function(pfn)
        Option.bCamera_FollowPlayer = false;
        Option.bCamera_MouseMove = false;
        Option.bCamera_MouseScale = false;
        Tween(2,Camera,
            { target_x = 200,scale = 2 },'linear',function () 
            if pfn then pfn() end
        end)
    end);

    self:CreateChain(1,function(pfn)
        Tween(2,Camera,
            { target_y = 200,scale = 1 },'linear',function ()
            if pfn then pfn() end
        end)
    end);

    self:CreateChain(1,function(pfn)
        Option.bCamera_FollowPlayer = true;
        Option.bCamera_MouseMove = true;
        Option.bCamera_MouseScale = true;
        if pfn then pfn() end
    end);

    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self:Process_1();
        end);
    end);

end

function TheOridinaryWorld:DestoryHandler()
    Camera.scale = 1;
end