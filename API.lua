
-- 切换动画
-- if key == "1" then 
--     local iAnimateSys = self.tbCurScene:GetSystemByName("AnimationSystem");
--     self.iPlayer:ChangeiCompoParam({
--         ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, nTotalFrame= 5, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
--     })
--     iAnimateSys:ReSetFrame(self.iPlayer);
--     iAnimateSys:Play(self.iPlayer);
-- end 
-- if key == "2" then 
--     local iAnimateSys = self.tbCurScene:GetSystemByName("AnimationSystem");
--     self.iPlayer:ChangeiCompoParam({
--         ["Animate"] = { sImg = "tc", nQuadW = 30, nQuadH = 55, nTotalFrame= 18, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
--     })
--     iAnimateSys:ReSetFrame(self.iPlayer);
--     iAnimateSys:Play(self.iPlayer);
-- end

-- 游戏链系统
-- self:CreateChain("Chain1",4,function (pfn) 
--     if pfn then pfn() end
-- end,function (pfn)
--     if pfn then pfn() end
-- end);

-- self:ExecuteChain(true,function ()
--     self:Trace(1,"Chain System complete!")
    -- self:NextProcess(function()
    --     self:Process_2();
    -- end);
-- end);

-- 缓动用法 -- https://github.com/kikito/tween.lua
-- local iScene = self:GetCurScene();
-- local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
-- local iPlayer = iScene:GetPlayer(1);
-- local w = iPlayer:GetiCompo("Size").w;
-- local h = iPlayer:GetiCompo("Size").h;
-- iPlayer:ChangeiCompoParam({
--     ["Position"] = { x = (graphicsWidth/2) - (w/2), y = graphicsHeight + 90 };
-- })
-- Tween(2,iPlayer:GetiCompo("Position"),{ x = (graphicsWidth/2) - (w/2),y = graphicsHeight - h - 90},'inOutBack',function ()
--     if pfn then pfn() end
-- end)

-- 创建Actor
-- local iScene = self:GetCurScene();
-- local iActor = ActorMgr:CreateActor("Actor")
-- iScene:AddActor(iActor);
-- iActor:ChangeiCompoParam({
--     ["Position"] = { x = (graphicsWidth/2) - (w/2), y = 0 - 120 };
-- })

-- 操作摄像头
-- Option.bCamera_FollowPlayer = false -- 先停止摄像机跟随
-- Tween(2,Camera,
--     { target_x = 200,scale = 2 },'linear',function () 
--     if pfn then pfn() end
-- end)

-- 角度转弧度
-- math.rad(360 * 15)

-- Scene_1中创建UI
-- { sUIType = "ShapeButton", sUseName = "btn_3", tbProperty = {
--     sName = "黑色";
--     x = 50; y = 170; w = 70; h = 50;
--     style = {
--         bBg = true;
--         bBorder = true;  
--         bgcolor = {0,0,0,1},
--         txtcolor = {1,1,1,1},
--         sborderFill = "line",
--         sbgFill = "fill",
--         bordercolor = {1,1,1,1},
--         nFontSize = 182; bHoverColor = {0.5,0.5,1,1},
--     }
-- }},

-- 动态创建UI
-- local btn_1 = UIMgr:CreateUI("ShapeButton","btn_1",{
--     sName = "黑色";
--     x = 50; y = 170; w = 70; h = 50;
--     style = {
--         bBg = true;
--         bBorder = true;  
--         bgcolor = {0,0,0,1},
--         txtcolor = {1,1,1,1},
--         sborderFill = "line",
--         sbgFill = "fill",
--         bordercolor = {1,1,1,1},
--         nFontSize = 182; bHoverColor = {0.5,0.5,1,1},
--     }
-- })

-- 切换动画代码片段
-- local player = ActorMgr:GetActor("Player1");
-- local iAnimateSys = self:GetCurScene():GetSystemByName("AnimationSystem");
-- UIMgr:GetUI("btn_1"):SetAttr("onHover",function ()
--     player:ChangeiCompoParam({
--         ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, 
--         nTotalFrame= 5, nLoop = 0, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
--     })
--     iAnimateSys:ReSetFrame(player);
--     iAnimateSys:Play(player);
-- end)
-- UIMgr:GetUI("btn_2"):SetAttr("onHover",function ()
--     player:ChangeiCompoParam({
--         ["Animate"] = { sImg = "hero_ani", nQuadW = 64, nQuadH = 128, 
--         nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
--     })
--     iAnimateSys:ReSetFrame(player);
--     iAnimateSys:Play(player);
-- end)

-- local r, c, h = http.request ({
--     method = "POST",
--     url = "http://127.0.0.1:5000/"
-- })
-- self:Trace(1,r,c,h)

-- socket.http 与 flask 通信
-- function Scene1:StartHandler()
--     local r, c, h = http.request ({
--         method = "GET",
--         url = "http://127.0.0.1:5000/"
--     })
--     self:Trace(1,r,c,h.ncount)
--     UIMgr:GetUI("btn_1"):SetAttr("sText",h.ncount)
--     UIMgr:GetUI("btn_1"):SetAttr("onClick",function ()
--         local r, c, h = http.request ({
--             method = "GET",
--             url = "http://127.0.0.1:5000/"
--         })
--         self:Trace(1,r,c,h.ncount)
--         UIMgr:GetUI("btn_1"):SetAttr("sText",h.ncount)
--     end)

-- end

--------------------- DEMO -----------------------
-- _G.Scene1 = GameChainSystem:DeriveClass("Scene1");

-- function Scene1:StartHandler()

--     self.fileName = "";

--     UIMgr:GetUI("btn_2"):SetAttr("bVisible",false);

--     UIMgr:GetUI("btn_1"):SetAttr("onClick",function()
--         UIMgr:GetUI("btn_1"):SetAttr("bVisible",false);
--         self.fileName = UIMgr:GetUI("input_1"):GetAttr("sText");
--         UIMgr:GetUI("btn_1"):SetAttr("bVisible",false);
--         UIMgr:GetUI("input_1"):SetAttr("bVisible",false);
--         UIMgr:GetUI("btn_2"):SetAttr("bVisible",true);
--     end);

--     UIMgr:GetUI("btn_2"):SetAttr("onClick",function()
--         UIMgr:GetUI("btn_1"):SetAttr("bVisible",true);
--         UIMgr:GetUI("input_1"):SetAttr("bVisible",true);
--         UIMgr:GetUI("btn_2"):SetAttr("bVisible",false);
--         self.fileName = "";
--     end);

-- end

-- function Scene1:Render() 
--     love.graphics.setColor(1,1,1,1)
--     local font = AssetsMgr:GetFont(202);
--     love.graphics.setFont(font);
--     love.graphics.print(self.fileName,10,10)
-- end 

-- UI缓动效果
-- UIMgr:GetUI("btn_1"):SetAttr("onClick", function ()
--     Tween(2,UIMgr:GetUI("btn_1"):GetAttribute(),{ w = UIMgr:GetUI("btn_1"):GetAttr("w") + 200 },'inOutBack',function () end)
-- end)