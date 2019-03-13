-- 颜色
local HP = {};

function HP:New(tbParams) 
    local obj = Compo:DeriveClass("HP");
    obj.hp = tbParams.hp;
    return obj; 
end 

return HP;