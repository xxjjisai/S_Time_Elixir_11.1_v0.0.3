_G.SceneMgr = Class:DeriveClass("SceneMgr");

SceneMgr.tbCurScene = nil;
SceneMgr.nSceneID = 0;
SceneMgr.bStart = false;
SceneMgr.iPlayer = nil;
SceneMgr.tbSceneList = {};
SceneMgr.nPlayerIndex = 1;

function SceneMgr:Init()
    self.tbCurScene = nil;
    self.bStart = false;
    self.iPlayer = nil;
    self.nPlayerIndex = 1;
end

function SceneMgr:Start()  
    self:Init();
    self.tbCurScene = Scene:DeriveClass("Scene");
    self.nSceneID = self.nSceneID + 1;
    Include:SceneSystemAndCfg(self.nSceneID);
    self.tbCurScene.nSceneID = self.nSceneID;
    self.tbSceneList[self.nSceneID] = self.tbCurScene;
    ContentMgr:ProduceHandler(self.tbCurScene,function ()
        self.iPlayer = self.tbCurScene:GetActorByTagType("Player");
        self:StartSystem();
        self:StartUI();
        -- CameraMgr:Fade(0.1, 0, 0, 0, 1,function()
            self.bStart = true;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
            -- CameraMgr:Fade(3.5, 0, 0, 0, 0);
        -- end)
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

function SceneMgr:StartUI()
    local tbUIList = self.tbCurScene:GetAllUI()
    for _,iUI in ipairs(tbUIList) do 
        if iUI.Start then 
            iUI:Start();
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

function SceneMgr:UpdateUI(dt)
    local tbUIList = self.tbCurScene:GetAllUI()
    for _,iUI in ipairs(tbUIList) do 
        if iUI.Update then 
            iUI:Update(dt);
        end
    end
end

function SceneMgr:SetAppointScene(nSceneID,sOper)
    if sOper ~= nil then 
        if sOper == "+" then 
            nSceneID = self:GetCurSceneID() + 1;
        elseif sOper == "-" then  
            nSceneID = self:GetCurSceneID() - 1;
        end 
    end 
    -- 如果是设计的场景，查看是否超过场景总数
    if nSceneID > Option.nMaxSceneCount then 
        self:Trace(1," Max Scene Count !!!")
        return
    end
    self.bStart = false;
    self.tbCurScene = nil;
    self.tbCurScene = self:GetAppointScene(nSceneID);
    if self.tbCurScene == nil then 
        -- Option.sGameState = "GUODU";
        -- GuoDuMgr:Start(function ()
            Option.sGameState = "PLAY";
            self:Start();
        -- end);
        return;
    end 
    ContentMgr:UninstallHandler(self.tbCurScene,function ()
        ContentMgr:ProduceHandler(self.tbCurScene,function ()
            self.iPlayer = self.tbCurScene:GetActorByTagType("Player");
            self:StartSystem();
            self:StartUI();
            -- Option.sGameState = "GUODU"
            -- GuoDuMgr:Start(function ()
                Option.sGameState = "PLAY";
                self.bStart = true;
            -- end);
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
    self:UpdateUI(dt);
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

    local tbUIList = self.tbCurScene:GetAllUI();
    for _,iUI in ipairs(tbUIList) do 
        if iUI.Render then 
            iUI:Render(dt);
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

        UIMgr:SetInputFocus(nil);

        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.MouseDown then  
                iUI:MouseDown(x, y, button, istouch, presses)  
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
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.MouseUp then 
                iUI:MouseUp(x, y, button, istouch, presses)  
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
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.MouseMoved then 
                iUI:MouseMoved(x, y, dx, dy, istouch)
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
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.KeyBoardDown then 
                iUI:KeyBoardDown(key, scancode, isrepeat) 
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
                iSystem:KeyBoardUp(key, scancode)
            end
        end
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.KeyBoardUp then 
                iUI:KeyBoardUp(key, scancode)
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
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.WheelMoved then 
                iUI:WheelMoved(x, y)
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
        local tbUIList = self.tbCurScene:GetAllUI()
        for _,iUI in ipairs(tbUIList) do 
            if iUI.TextInput then 
                iUI:TextInput(text)
            end
        end
    end
end