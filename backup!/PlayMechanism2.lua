_G.PlayMechanism2 = GameChainSystem:DeriveClass("PlayMechanism2");

function PlayMechanism2:StartHandler() 
    self:Process_1();
end

-- 初始化玩家位置
function PlayMechanism2:Process_1()
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
    end);
end
