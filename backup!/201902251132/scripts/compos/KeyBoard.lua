-- 键盘
local KeyBoard = {};

function KeyBoard:New(tbParams) 
    local obj = Compo:DeriveClass("KeyBoard");
    obj.bActive = tbParams.bActive; -- 是否激活
    obj.W = "w";
    obj.A = "a";
    obj.S = "s";
    obj.D = "d";
    return obj; 
end 

return KeyBoard;