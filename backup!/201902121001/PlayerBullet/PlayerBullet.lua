local PlayerBullet = {};
function PlayerBullet:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return PlayerBullet;