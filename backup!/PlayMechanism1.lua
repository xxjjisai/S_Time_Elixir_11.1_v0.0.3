_G.PlayMechanism1 = GameChainSystem:DeriveClass("PlayMechanism1");

function PlayMechanism1:StartHandler() 
    self:Process_1();
end

-- 初始化玩家位置
function PlayMechanism1:Process_1()
    self:CreateChain("ReSetPlayerPosition",0.1,function (pfn) 
        local iScene = self:GetCurScene();
        local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
        local iPlayer = iScene:GetPlayer();
        local w = iPlayer:GetiCompo("Size").w;
        local h = iPlayer:GetiCompo("Size").h;
        iPlayer:ChangeiCompoParam({
            ["Position"] = { x = (graphicsWidth/2) - (w/2), y = graphicsHeight + 90 };
        })
        Tween(2,iPlayer:GetiCompo("Position"),
            { x = (graphicsWidth/2) - (w/2),y = graphicsHeight - h - 90},'inOutBack',function ()
            if pfn then pfn() end
        end)
    end);
    self:ExecuteChain(true,function ()
        self:Trace(1,"Chain System complete!")
        self:Next();
        self:Process_2();
    end);
end

-- 循环创建敌人
function PlayMechanism1:Process_2() 

    self:CreateChain("CreateEnemy_Red",0.5,function (pfn) 
        local iScene = self:GetCurScene();
        local iRedEnemy = ActorMgr:CreateActor("RedEnemy")
        iScene:AddActor(iRedEnemy);
        local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
        iAnimateSys:ReSetFrame(iRedEnemy);
        iAnimateSys:Play(iRedEnemy);
        local w = iRedEnemy:GetiCompo("Size").w;
        local h = iRedEnemy:GetiCompo("Size").h;
        iRedEnemy:ChangeiCompoParam({
            ["Position"] = { x = (graphicsWidth/2) - (w/2), y = 0 - 120 };
        })
        Tween(2,iRedEnemy:GetiCompo("Position"),
            { x = math.random(94,graphicsWidth-94),y = math.random(0 + 118,0 + 120)},'inOutBack',function ()
            -- 改变敌人状态为发射子弹
            if pfn then pfn() end
        end)
    end);
    
    self:CreateChain("CreateEnemy_Red",0.5,function (pfn) 
        local iScene = self:GetCurScene();
        local iRedEnemy = ActorMgr:CreateActor("RedEnemy")
        iScene:AddActor(iRedEnemy);
        local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
        iAnimateSys:ReSetFrame(iRedEnemy);
        iAnimateSys:Play(iRedEnemy);
        local w = iRedEnemy:GetiCompo("Size").w;
        local h = iRedEnemy:GetiCompo("Size").h;
        iRedEnemy:ChangeiCompoParam({
            ["Position"] = { x = (graphicsWidth/2) - (w/2), y = 0 - 120 };
        })
        Tween(2,iRedEnemy:GetiCompo("Position"),
            { x = math.random(94,graphicsWidth-94),y = math.random(0 + 118,0 + 120)},'inOutBack',function ()
            -- 改变敌人状态为发射子弹
            if pfn then pfn() end
        end)
    end);
    
    self:CreateChain("CreateEnemy_Red",0.5,function (pfn) 
        local iScene = self:GetCurScene();
        local iRedEnemy = ActorMgr:CreateActor("RedEnemy")
        iScene:AddActor(iRedEnemy);
        local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
        iAnimateSys:ReSetFrame(iRedEnemy);
        iAnimateSys:Play(iRedEnemy);
        local w = iRedEnemy:GetiCompo("Size").w;
        local h = iRedEnemy:GetiCompo("Size").h;
        iRedEnemy:ChangeiCompoParam({
            ["Position"] = { x = (graphicsWidth/2) - (w/2), y = 0 - 120 };
        })
        Tween(2,iRedEnemy:GetiCompo("Position"),
            { x = math.random(94,graphicsWidth-94),y = math.random(0 + 118,0 + 120)},'inOutBack',function ()
            -- 改变敌人状态为发射子弹
            if pfn then pfn() end
        end)
    end);


    self:ExecuteChain(true,function ()
        self:Trace(1,"Chain System complete!")
        self:Process_2();
    end);
end

function PlayMechanism1:Process_3() 

end