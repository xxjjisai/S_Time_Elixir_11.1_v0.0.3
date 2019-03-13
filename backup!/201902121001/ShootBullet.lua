-- 方向
local ShootBullet = {};

function ShootBullet:New(tbParams) 
    local obj = Compo:DeriveClass("ShootBullet");
    obj.nBulletType = tbParams.nBulletType;
    return obj; 
end 

return ShootBullet;