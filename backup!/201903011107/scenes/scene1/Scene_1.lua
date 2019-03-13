
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player"; sUseName = "Player1", tbProperty = {
            ["Color"] = { r = 1, g = 0, b = 1, a = 1 };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sText = "隐藏";
            x = 50; y = 470;
            w = 70; h = 50;
            style = {
                bBg = true;
                bBorder = true;  
                bgcolor = {1,0,0,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 202; bHoverColor = {0.5,0.5,1,1},
            }
        }}, 
        { sUIType = "ShapeButton", sUseName = "btn_2", tbProperty = {
            sText = "显示";
            x = 130; y = 470;
            w = 70; h = 50;
            style = {
                bBg = true;
                bBorder = true;  
                bgcolor = {1,0,0,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 202; bHoverColor = {0.5,0.5,1,1},
            }
        }},  
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "KeyBoardMoveSystem",
        "Scene1",
    };
}