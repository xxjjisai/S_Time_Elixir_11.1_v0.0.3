local ShapeTextInputConfig = 
{
    bVisible = true;
    bEnabled = true;
    x = 100;
    y = 100;
    w = 100;
    h = 50;
    style = {
        bBg = true;
        bBorder = false;
        sborderFill = "line";
        sbgFill = "fill";
        nFontSize = 182;
        bgcolor = {1,1,1,1};
        txtcolor = {0,0,0,1};
        bordercolor = {1,1,1,1};
        bHoverColor = {0.9,0.9,0.9,1};
    };
    sText = "";
    onClick = nil; -- 点击
    onHover = nil; -- 滑入
    bHover = false; -- 是否滑入
    bHoverMove = false; -- 是否滑入移动
    bShowHover = true; 
    bNumber = false; -- 是否限制只输入数字 
    nLayerIndex = 1; -- 渲染层级
}
return ShapeTextInputConfig