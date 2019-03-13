
_G.Scene_2 = 
{
    tbActor = 
    {
        { sActorType = "Player"; tbProperty = {
            ["Color"] = { r = 1, g = 1, b = 0, a = 1 };
            ["Sprite"] = { sImg = "hero_001" };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sName = "紫色";
            x = 50; y = 170; w = 70; h = 50;
            style = {
                bBg = true;
                bBorder = true;  
                bgcolor = {1,0,1,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 182; bHoverColor = {0.5,0.5,1,1},
            }
        }},
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        -- "AnimationSystem",
        "KeyBoardMoveSystem",
        "Scene2",
    };
}