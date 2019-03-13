-- 方向
local Speed = {};

function Speed:New(tbParams) 
    local obj = Compo:DeriveClass("Speed");
    obj.nSpeed = tbParams.nSpeed;
    return obj; 
end 

return Speed;