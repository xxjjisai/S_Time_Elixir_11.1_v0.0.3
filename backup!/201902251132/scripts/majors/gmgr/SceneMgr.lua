_G.SceneMgr = Class:DeriveClass("SceneMgr");

SceneMgr.tbCurScene = nil;
SceneMgr.nSceneID = 0;
SceneMgr.bStart = false;
SceneMgr.iPlayer = false;
SceneMgr.tbSceneList = {};
SceneMgr.nPlayerIndex = 1;

function SceneMgr:Start()  
    self.tbCurScene = nil;
    self.nSceneID = 0;
    self.bStart = false;
    self.iPlayer = false;
    self.tbSceneList = {};
    self.nPlayerIndex = 1;
    self.tbCurScene = Scene:DeriveClass("Scene");
    table.insert(self.tbSceneList,self.tbCurScene);
    self.nSceneID = self.nSceneID + 1;
    self.tbCurScene.nSceneID = self.nSceneID;
    UIMgr:SetCurScene(self.tbCurScene);
    ContentMgr:ProduceHandler(self.tbCurScene,function ()
        self.iPlayer = self.tbCurScene:GetActorByTagType("Player");
        self:StartSystem();
        CameraMgr:Fade(0.1, 0, 0, 0, 1,function()
            self.bStart = true;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
            CameraMgr:Fade(3.5, 0, 0, 0, 0);
        end)
    end);
end

function SceneMgr:GetCurPlayer()
    return self.iPlayer;
end

function SceneMgr:SetCurPlayer(iPlayer)
    self.iPlayer = iPlayer;
end

function SceneMgr:GetCurScene()
    return self.tbCurScene;
end

function SceneMgr:GetCurSceneID()
    return self.nSceneID;
end 

function SceneMgr:GetAppointScene(nSceneID)
    return self.tbSceneList[nSceneID];
end

function SceneMgr:StartSystem()
    local tbSystemList = self.tbCurScene:GetSystemList();
    for _,iSystem in ipairs(tbSystemList) do 
        if iSystem.Start then 
            iSystem:Start();
        end
    end
end 

function SceneMgr:UpdateSystem(dt)
    local tbSystemList = self.tbCurScene:GetSystemList();
    for _,iSystem in ipairs(tbSystemList) do 
        if iSystem.Update then 
            iSystem:Update(dt);
        end
    end
end

function SceneMgr:SetAppointScene(nSceneID,sOper)
    if nSceneID == nil then 
        if sOper == "+" then 
            nSceneID = self:GetCurSceneID() + 1;
        elseif sOper == "-" then  
            nSceneID = self:GetCurSceneID() - 1;
        end 
    end 
    -- 如果是设计的场景，查看是否超过场景总数
    if nSceneID > Option.nMaxSceneCount then 
        return
    end
    self.bStart = false;
    self.tbCurScene = nil;
    self.tbCurScene = self:GetAppointScene(nSceneID);
    if self.tbCurScene == nil then 
        Option.sGameState = "GUODU";
        GuoDuMgr:Start(function ()
            Option.sGameState = "PLAY";
            self:Start();
        end);
        return;
    end 
    ContentMgr:UninstallHandler(self.tbCurScene,function ()
        ContentMgr:ProduceHandler(self.tbCurScene,function ()
            self.iPlayer = self.tbCurScene:GetActorByTagType("Player");
            self:StartSystem();
            Option.sGameState = "GUODU"
            GuoDuMgr:Start(function ()
                Option.sGameState = "PLAY";
                self.bStart = true;
            end);
            -- CameraMgr:Fade(0.1, 0, 0, 0, 1,function()
            --     self.bStart = true;
            --     CameraMgr:Fade(1.5, 0, 0, 0, 0);
            -- end)
        end);
    end)
end

function SceneMgr:Update(dt)
    if not self.bStart then return end;
    self:UpdateSystem(dt);
    if not self.iPlayer then return end; 
    CameraMgr:Follow(self.iPlayer);
end 

function SceneMgr:Render()
    if not self.bStart then return end;
    local tbSystemList = self.tbCurScene:GetSystemList();
    local str_stats = "";
    if Option.bBackGroundStatic then 
        CameraMgr:RenderAttach(function () 
            for _,iSystem in ipairs(tbSystemList) do 
                str_stats = str_stats..iSystem.sClassName.."\n";
                if iSystem.Render then 
                    iSystem:Render();
                end
            end
        end)
    else 
        for _,iSystem in ipairs(tbSystemList) do 
            str_stats = str_stats..iSystem.sClassName.."\n";
            if iSystem.Render then 
                iSystem:Render();
            end
        end
    end

    if Option.bGameInfo then 
        -- System 列表
        love.graphics.setColor(1,0,1,1);
        love.graphics.setFont(AssetsMgr:GetFont(241));
        love.graphics.print(str_stats,10,10);
        -- Actor 数量
        local str_stats = "Actor Count:"..#self.tbCurScene:GetActorList();
        love.graphics.setColor(1,0,1,1);
        love.graphics.setFont(AssetsMgr:GetFont(241));
        love.graphics.print(str_stats,10,graphicsHeight - 20);
        -- 玩家坐标
        local px = self.iPlayer:GetiCompo("Transform").x
        local py = self.iPlayer:GetiCompo("Transform").y
        local str_player_pos = ("playerX:%d,playerY:%d"):format(px,py);
        love.graphics.print(str_player_pos,10,graphicsHeight - 40);
        -- 屏幕交点
        love.graphics.line( 0, graphicsHeight * 0.5, graphicsWidth, graphicsHeight * 0.5 )
        love.graphics.line( graphicsWidth * 0.5, 0, graphicsWidth * 0.5, graphicsHeight )
        love.graphics.rectangle("line",Camera.x,Camera.y,Camera.w,Camera.h)
    end
end

function SceneMgr:MouseDown(x, y, button, istouch, presses)   
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.MouseDown then 
                iSystem:MouseDown(x, y, button, istouch, presses);
            end
        end 
    end
end

function SceneMgr:MouseUp(x, y, button, istouch, presses)  
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.MouseUp then 
                iSystem:MouseUp(x, y, button, istouch, presses);
            end
        end
    end
end

function SceneMgr:MouseMoved(x, y, dx, dy, istouch)
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.MouseMoved then 
                iSystem:MouseMoved(x, y, dx, dy, istouch);
            end
        end
    end
end

function SceneMgr:KeyBoardDown(key, scancode, isrepeat) 
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.KeyBoardDown then 
                iSystem:KeyBoardDown(key, scancode, isrepeat);
            end
        end

        if key == "space" then 
            self.nPlayerIndex = self.nPlayerIndex + 1;
            self.iPlayer,self.nPlayerIndex = self.tbCurScene:GetPlayer(self.nPlayerIndex)
        end  
    end
end

function SceneMgr:KeyBoardUp(key, scancode)
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.KeyBoardUp then 
                iSystem:KeyBoardUp(key, scancode);
            end
        end
    end
end

function SceneMgr:WheelMoved(x, y)
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.WheelMoved then 
                iSystem:WheelMoved(x, y);
            end
        end
    end
end

function SceneMgr:TextInput(text)
    if self.bStart then 
        local tbSystemList = self.tbCurScene:GetSystemList();
        for _,iSystem in ipairs(tbSystemList) do 
            if iSystem.TextInput then 
                iSystem:TextInput(text);
            end
        end
    end
end