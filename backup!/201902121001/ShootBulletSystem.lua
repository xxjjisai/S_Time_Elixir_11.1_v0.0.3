-- 发射子弹
_G.ShootBulletSystem = System:DeriveClass("ShootBulletSystem");

ShootBulletSystem:SetRegisterCompo{
   "ShootBullet","Transform",
}

function ShootBulletSystem:Update(dt)
    local iScene = self:GetCurScene();
    for _,tbLayer in pairs(iScene:GetRenderList()) do
       for _,iActor in ipairs(tbLayer) do 
          repeat
            if not self:GetRegisterCompo(iActor) then break end
            local nBulletType = iActor:GetiCompo("ShootBullet").nBulletType;
            if nBulletType == "player" then 
                iActor:GetiCompo("Transform").y = iActor:GetiCompo("Transform").y - 300 * dt;
            elseif nBulletType == "enemy" then 

            end
          until true
       end
    end 
 end