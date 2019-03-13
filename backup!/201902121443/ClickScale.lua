-- 点击缩放
local ClickScale = {};

function ClickScale:New(tbParams) 
    local obj = Compo:DeriveClass("ClickScale");
    obj.bClicked = false;
    obj.nTargetScale = 1;
    obj.nOriginScale = 1;
    obj.tbTargetInfo = nil;
    return obj; 
end 

return ClickScale;