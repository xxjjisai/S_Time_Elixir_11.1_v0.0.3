
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1",tbProperty = {
            ["Color"] = { a=0 };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_year", tbProperty = {
            sText = "年"
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_year", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_month", tbProperty = {
            sText = "月"
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_month", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_day", tbProperty = {
            sText = "日"
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_day", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_hour", tbProperty = {
            sText = "时"
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_hour", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_min", tbProperty = {
            sText = "分"
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_min", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_sec", tbProperty = {
            sText = "秒"
        }},
        
        { sUIType = "ShapeTextInput", sUseName = "input_sec", tbProperty = {
            sText = ""
        }},

        { sUIType = "ShapeButton", sUseName = "btn_tb", tbProperty = {
            sText = "同步"
        }},

        { sUIType = "ShapeButton", sUseName = "btn_qd", tbProperty = {
            sText = "确定"
        }},

        { sUIType = "ShapeButton", sUseName = "btn_about", tbProperty = {
            sText = "!";w = 30;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_help", tbProperty = {
            sText = "?";w = 30;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_net", tbProperty = {
            sText = "O";w = 30;
        }},
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "Scene1",
    };
}