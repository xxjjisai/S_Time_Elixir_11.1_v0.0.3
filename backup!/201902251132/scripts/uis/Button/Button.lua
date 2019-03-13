local Button = {};
function Button:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   return obj;
end
return Button;