local ShapeButton = {};
function ShapeButton:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);

   function obj:Update(dt)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local tbMouse = {
         x = love.mouse.getX(),
         y = love.mouse.getY(),
         w = 1,
         h = 1
      }
      local tbButton = {
         x = self:GetAttr("x"),
         y = self:GetAttr("y"),
         w = self:GetAttr("w"),
         h = self:GetAttr("h")
      }
      if hitTestObject(tbMouse,tbButton) then 
         self:SetAttr("bHover",true); 
         if self:GetAttr("onHover") then  
            if not self:GetAttr("bHoverMove") then  
               self:GetAttr("onHover")();
               self:SetAttr("bHoverMove",true);
            end
         end
      else
         self:SetAttr("bHover",false); 
         self:SetAttr("bHoverMove",false);
      end 
   end

   function obj:Render()
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local bgcolor = self:GetAttr("style").bgcolor;
      local txtcolor = self:GetAttr("style").txtcolor;
      local bordercolor = self:GetAttr("style").bordercolor;
      if self:GetAttr("bShowHover") then 
         if self:GetAttr("bHover") then 
            local hovercolor = self:GetAttr("style").bHoverColor;
            bgcolor = {hovercolor[1],hovercolor[2],hovercolor[3],bgcolor[4]};
         end 
      end
      if self:GetAttr("style").bBg then 
         love.graphics.setColor(bgcolor);
         love.graphics.rectangle(self:GetAttr("style").sbgFill,self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
         if self:GetAttr("style").bBorder then 
            love.graphics.setColor(bordercolor);
            love.graphics.rectangle(self:GetAttr("style").sborderFill,self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
         end
      end
      love.graphics.setColor(txtcolor);
      local font = AssetsMgr:GetFont(self:GetAttr("style").nFontSize);
      love.graphics.setFont(font);
      local nFontx = ((self:GetAttr("x") + self:GetAttr("w")*0.5) ) - font:getWidth(self:GetAttr("sText"))*0.5;
      local nFonty = ((self:GetAttr("y") + self:GetAttr("h")*0.5) ) - font:getHeight(self:GetAttr("sText"))*0.5;
      love.graphics.print(self:GetAttr("sText"),nFontx,nFonty)
   end

   function obj:MouseDown(x,y,button,istouch, presses)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      if not self:GetAttr("bEnabled") then 
         return 
      end 
      local tbMouse = {
         x = x,
         y = y,
         w = 1,
         h = 1
      }
      local tbButton = {
         x = self:GetAttr("x"),
         y = self:GetAttr("y"),
         w = self:GetAttr("w"),
         h = self:GetAttr("h")
      }

      if hitTestObject(tbMouse,tbButton) then 
         if self:GetAttr("onClick") then 
            self:GetAttr("onClick")();
            return
         end
      end 
   end

   return obj;
end
return ShapeButton;