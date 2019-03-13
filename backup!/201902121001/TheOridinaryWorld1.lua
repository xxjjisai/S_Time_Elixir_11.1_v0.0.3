_G.TheOridinaryWorld1 = GameChainSystem:DeriveClass("TheOridinaryWorld1");

function TheOridinaryWorld1:StartHandler()
    -- 当前场景
    self.iScene = self:GetCurScene();
    self.bBreak = true;
    self.tbBulletList = {};
    self.iEnemy = nil;
    Option.bCamera_FollowPlayer = false;
    self.o_camera_scale = Camera.scale;
    self.o_camera_x = Camera.x;
    self.o_camera_y = Camera.y;
    -- love.window.setMode( graphicsWidth, graphicsHeight, {
    --     resizable = false;
    -- } )
    self:Process_1();
end

function TheOridinaryWorld1:Process_1()
    -- 当前玩家
    local iPlayer = self.iScene:GetPlayer();
    -- 初始化数据
    local w = iPlayer:GetiCompo("Transform").w;
    local h = iPlayer:GetiCompo("Transform").h;
    iPlayer:GetiCompo("Transform").x = graphicsWidth/2 - w/2;
    iPlayer:GetiCompo("Transform").y = graphicsHeight + h;
    local iAniSystem = self.iScene:GetSystemByName("AnimationSystem");
    -- 创建链条
    self:CreateChain(1,function(pfn)
        Tween(2,iPlayer:GetiCompo("Transform"),
            { y = 500 },'inOutBack',function () 
            if pfn then pfn() end
        end)
    end);

    -- 创建链条
    self:CreateChain(0.1,function(pfn)
        local iEnemy = ActorMgr:CreateActor("Enemy")
        self.iScene:AddActor(iEnemy);
        iEnemy:GetiCompo("Transform").x = graphicsWidth/2 - iEnemy:GetiCompo("Transform").w/2;
        iEnemy:GetiCompo("Transform").y = -70;
        iAniSystem:ReSetFrame(iEnemy)
        iAniSystem:Play(iEnemy) 
        self.iEnemy = iEnemy;
        Tween(2,iEnemy:GetiCompo("Transform"),
            { y = 70 },'inOutBack',function ()
            if pfn then pfn() end
        end) 
    end);

    self:CreateChain(1,function(pfn) 
        Tween(0.3,Camera,
            { y = 550 },'linear',function ()
            Tween(0.2,Camera,
                { scale = 3 },'linear',function ()
                if pfn then pfn() end
            end)
        end)
    end);

    self:CreateChain(1,function(pfn) 
        Tween(0.5,Camera,
            { scale = self.o_camera_scale },'linear',function ()
            Tween(0.2,Camera,
                { y = self.o_camera_y },'linear',function ()
                if pfn then pfn() end
            end)
        end)
    end);

    self:CreateChain(1,function(pfn) 
        Tween(0.5,Camera,
            { y = 150 },'linear',function ()
            Tween(0.2,Camera,
                { scale = 3 },'linear',function ()
                if pfn then pfn() end
            end)
        end)
    end);

    self:CreateChain(1,function(pfn) 
        Tween(0.5,Camera,
            { scale = self.o_camera_scale },'linear',function ()
            Tween(0.2,Camera,
                { y = self.o_camera_y },'linear',function ()
                if pfn then pfn() end
            end)
        end)
    end);

    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self.bBreak = false;
            self:Process_2();
        end);
    end);
end 

-- 发射子弹
function TheOridinaryWorld1:Process_2()
    if self.bBreak then 
        -- 执行链条
        self:NextProcess(function ()
            self:Process_3();
        end);
        return;
    end 
    local iAniSystem = self.iScene:GetSystemByName("AnimationSystem");
    -- 当前玩家
    local iPlayer = self.iScene:GetPlayer();
    -- 初始化数据
    local px = iPlayer:GetiCompo("Transform").x;
    local py = iPlayer:GetiCompo("Transform").y;
    local pw = iPlayer:GetiCompo("Transform").w;
    -- 创建链条
    self:CreateChain(0.3,function(pfn)
        local iBullet = ActorMgr:CreateActor("PlayerBullet")
        self.iScene:AddActor(iBullet);
        iBullet:GetiCompo("Transform").x = px+pw*0.5*0.5
        iBullet:GetiCompo("Transform").y = py;
        iAniSystem:ReSetFrame(iBullet)
        iAniSystem:Play(iBullet) 
        table.insert(self.tbBulletList,iBullet);
        if pfn then pfn() end
    end);
    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self:Process_2();
        end);
    end);
end

function TheOridinaryWorld1:Process_3()
    self:Trace(1,"TheOridinaryWorld1:Process_3 complete")
    Option.sGameState = "MENU"
end

function TheOridinaryWorld1:Update(dt)
    self:MovePlayer(dt);
    self:BulletShootTest(dt);
    self:BulletDestory(dt);
end

function TheOridinaryWorld1:BulletShootTest(dt) 
    if not self.iEnemy then return end;
    local ex = self.iEnemy:GetiCompo("Transform").x;
    local ey = self.iEnemy:GetiCompo("Transform").y;
    local ew = self.iEnemy:GetiCompo("Transform").w;
    local eh = self.iEnemy:GetiCompo("Transform").h;
    for i,iBullet in ipairs(self.tbBulletList) do 
        local bx = iBullet:GetiCompo("Transform").x;
        local by = iBullet:GetiCompo("Transform").y;
        local bw = iBullet:GetiCompo("Transform").w;
        local bh = iBullet:GetiCompo("Transform").h;
        local obj1 = { x = ex, y = ey, w = ew, h = eh }; 
        local obj2 = { x = bx, y = by, w = bw, h = bh }; 
        if hitTestObject(obj1,obj2) then 
            self.iEnemy:GetiCompo("HP").hp = self.iEnemy:GetiCompo("HP").hp - 10;
            if self.iEnemy:GetiCompo("HP").hp <= 0 then 
                ActorMgr:RemoveActor(self.iEnemy);
                self.iEnemy = nil;
                self.bBreak = true;
            end
            table.remove(self.tbBulletList,i) 
            ActorMgr:RemoveActor(iBullet);
        end
    end
end

function TheOridinaryWorld1:Render()
    if not self.iEnemy then return end;
    love.graphics.print(self.iEnemy:GetiCompo("HP").hp,100,100)
end

function TheOridinaryWorld1:BulletDestory(dt)
    for _,iBullet in ipairs(self.tbBulletList) do 
        if iBullet:GetiCompo("Transform").y < 100 then 
            ActorMgr:RemoveActor(iBullet);
            table.remove(self.tbBulletList,i)
        end
    end
end

function TheOridinaryWorld1:MovePlayer(dt)
    local iPlayer = self.iScene:GetPlayer();
    if iPlayer:GetiCompo("Transform").x < 0 then 
        iPlayer:GetiCompo("Transform").x = 0;
        return 
    end

    if iPlayer:GetiCompo("Transform").x + iPlayer:GetiCompo("Transform").w > graphicsWidth then 
        iPlayer:GetiCompo("Transform").x = graphicsWidth - iPlayer:GetiCompo("Transform").w;
        return 
    end

    if iPlayer:GetiCompo("Transform").y < 0 then 
    iPlayer:GetiCompo("Transform").y = 0;
        return 
    end

    -- if iPlayer:GetiCompo("Transform").y + iPlayer:GetiCompo("Transform").h > graphicsHeight then 
    --     iPlayer:GetiCompo("Transform").y = graphicsHeight - iPlayer:GetiCompo("Transform").h;
    --     return 
    -- end

    local keyw = love.keyboard.isDown("w");
    if keyw then 
        iPlayer:GetiCompo("Transform").y = iPlayer:GetiCompo("Transform").y - 200 * dt;
    end
    local keys = love.keyboard.isDown("s");
    if keys then 
        iPlayer:GetiCompo("Transform").y = iPlayer:GetiCompo("Transform").y + 200 * dt;
    end
    local keya = love.keyboard.isDown("a");
    if keya then 
        iPlayer:GetiCompo("Transform").x = iPlayer:GetiCompo("Transform").x - 200 * dt;
    end
    local keyd = love.keyboard.isDown("d");
    if keyd then 
        iPlayer:GetiCompo("Transform").x = iPlayer:GetiCompo("Transform").x + 200 * dt;
    end 
end

function TheOridinaryWorld1:DestoryHandler()
    self.tbBulletList = {};
end