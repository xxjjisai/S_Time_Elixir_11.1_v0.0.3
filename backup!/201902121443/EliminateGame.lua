_G.EliminateGame = GameChainSystem:DeriveClass("EliminateGame");

function EliminateGame:StartHandler()
    self:Init(function ()
        self:Process_1();
    end)
end

function EliminateGame:Init(pfn) 

    self.nCol = 10;
    self.nRow = 10;


    if pfn then pfn() end
end

function EliminateGame:Process_1()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();

    iPlayer:GetiCompo("Transform").x = 120;
    iPlayer:GetiCompo("Transform").y = 103;
    iPlayer:GetiCompo("Color").a = 0;

    local iAniSystem = iScene:GetSystemByName("AnimationSystem");

    -- 创建链条 
    self:CreateChain(1,function(pfn)
        for i=0,self.nCol-1 do 
            for j=0,self.nRow-1 do 
                local iEnemy = ActorMgr:CreateActor("Enemy")
                iScene:AddActor(iEnemy);
                iEnemy:GetiCompo("Transform").x = j * iEnemy:GetiCompo("Transform").w;
                iEnemy:GetiCompo("Transform").y = i * iEnemy:GetiCompo("Transform").h;
                iAniSystem:ReSetFrame(iEnemy)
                iAniSystem:Play(iEnemy) 
            end
        end
    end);
 
    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            -- self:Process_1();
        end);
    end);
end

function EliminateGame:DestoryHandler()

end

function EliminateGame:Update(dt)
    self:MovePlayer(dt);
end

function EliminateGame:MovePlayer(dt)

    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer();
    
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