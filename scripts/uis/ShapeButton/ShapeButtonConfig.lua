local ShapeButtonConfig = 
{
    bVisible = true;
    bEnabled = true;
    nItemID = 0;
    x = 100;
    y = 100;
    w = 70;
    h = 50;
    bAutoPos = false;
    style = {
        bBg = true;
        bBorder = false;
        sborderFill = "line",
        sbgFill = "fill",
        nFontSize = 182;
        bgcolor = {0.3,0.3,1,1},
        txtcolor = {1,1,1,1},
        bordercolor = {1,1,1,1},
        bHoverColor = {0.5,0.5,1,1},
    };
    sText = "按钮";
    onClick = nil; -- 点击
    onHover = nil; -- 滑入
    bHover = false; -- 是否滑入
    bHoverMove = false; -- 是否滑入移动
    bShowHover = true; 
    nLayerIndex = 1; -- 渲染层级
}
return ShapeButtonConfig