_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler()  
    
    local player = ActorMgr:GetActor("Player1");
    local iAnimateSys = self:GetCurScene():GetSystemByName("AnimationSystem");

    UIMgr:GetUI("btn_1"):SetAttr("onHover",function ()
        player:ChangeiCompoParam({
            ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, 
            nTotalFrame= 5, nLoop = 0, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
        })
        iAnimateSys:ReSetFrame(player);
        iAnimateSys:Play(player);
    end)

    UIMgr:GetUI("btn_2"):SetAttr("onHover",function ()
        player:ChangeiCompoParam({
            ["Animate"] = { sImg = "hero_ani", nQuadW = 64, nQuadH = 128, 
            nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
        })
        iAnimateSys:ReSetFrame(player);
        iAnimateSys:Play(player);
    end)
    

end