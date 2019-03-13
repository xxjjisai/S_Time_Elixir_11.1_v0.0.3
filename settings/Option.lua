_G.Option = 
{
    bDebug = false;                                 -- [Y]是否为调试模式
    sGameType = "ROGUELIKE";                        -- [Y]当前游戏类型（用来设定渲染层级方式等）
    bGameInfo = false;                              -- [Y]System及Actor信息
    bDoFileComplete = false;                        -- [N]文件是否加载完成
    bMenuPlayed = true;                             -- [Y]是否播放赞助商
    bLog = false;                                   -- [Y]日志
    bLoaded = false;                                -- [N]是否加载资源完成
    sTitle = "";                                    -- [N]标题
    sGameState = "LOAD";                            -- [Y]游戏全局状态机 LOAD MENU PLAY OVER
    bExit = false;                                  -- [N]是否退出
    bCamera_MouseMove = true;                       -- [Y]是否适用鼠标右键移动摄像机
    bCamera_KeyMove = false;                        -- [Y]是否适用键盘 Left Shift 移动摄像机
    bCamera_MouseScale = true;                      -- [Y]是否鼠标滚轮缩放摄像机
    bPaused = false;                                -- [Y]是否暂停
    nMaxSceneCount = 0;                             -- [N]如果是设计的场景，场景总数，在 include 中进行赋值
    bStore = false;                                 -- [Y]是否开启外部存储
    bBackGroundStatic = true;                      -- [Y]游戏背景是否为静态（是否开启摄像机干涉）
    bCamera_FollowPlayer = true;                    -- [Y]摄像机是否跟随玩家
}