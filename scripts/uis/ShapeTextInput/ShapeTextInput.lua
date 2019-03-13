local ShapeTextInput = {};
function ShapeTextInput:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.sText = "";
   obj.tbShine = {
      sText = "|";
      tbColor = { r = 0, g = 0, b = 0, a = 1 };
   };
   -- obj.nLastTime = 0;

   function obj:Start()
      self:OpenRepeat(true);
   end

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

      -- local nNow = GetTime();
      -- if nNow - self.nLastTime >= 1 then 
      --    self.tbShine.tbColor.a = 0;
      --    self.nLastTime = nNow;
      --    return
      -- end
      -- self.tbShine.tbColor.a = 1;
      
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
         love.graphics.rectangle(self:GetAttr("style").sbgFill,
         self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
         if self:GetAttr("style").bBorder then 
            love.graphics.setColor(bordercolor);
            love.graphics.rectangle(self:GetAttr("style").sborderFill,
            self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
         end
      end
      love.graphics.setColor(txtcolor);
      local font = AssetsMgr:GetFont(self:GetAttr("style").nFontSize);
      love.graphics.setFont(font);
      local nFontx = ( (self:GetAttr("x") + self:GetAttr("w")*0.5) ) - font:getWidth(self:GetAttr("sText"))*0.5;
      local nFonty = ( (self:GetAttr("y") + self:GetAttr("h")*0.5) ) - font:getHeight(self:GetAttr("sText"))*0.5;
      love.graphics.print(self:GetAttr("sText"),nFontx,nFonty);
      local r,g,b,a = self.tbShine.tbColor.r,self.tbShine.tbColor.g,self.tbShine.tbColor.b,self.tbShine.tbColor.a
      love.graphics.setColor(r,g,b,a);
      -- love.graphics.print(self.tbShine.sText,nFontx + font:getWidth(self:GetAttr("sText"))+3,nFonty-2);
   end 

   function obj:TextInput(text)
      if self:GetAttr("bNumber") then
         text = tonumber(text);
         if not text then return end
      end

      if UIMgr:GetInputFocus() ~= self.sClassName then 
         return 
      end
      local font = AssetsMgr:GetFont(self:GetAttr("style").nFontSize);
      if font:getWidth(self:GetAttr("sText")) >= (self:GetAttr("w")-20) then 
         return;
      end
      self:SetAttr("sText",self:GetAttr("sText")..text);
   end

   function obj:OpenRepeat(bRepeat)
      love.keyboard.setKeyRepeat(bRepeat);
   end

   function obj:KeyBoardDown(key, scancode, isrepeat)
      if key == "backspace" then
         if UIMgr:GetInputFocus() ~= self.sClassName then 
            return 
         end
         local byteoffset = utf8.offset(self:GetAttr("sText"), -1);
         if byteoffset then
            local text = string.sub(self:GetAttr("sText"), 1, byteoffset - 1);
            self:SetAttr("sText",text);
         end
      end
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
         UIMgr:SetInputFocus(self.sClassName);
         if self:GetAttr("onClick") then 
            self:GetAttr("onClick")();
            return
         end
      end 
   end

   return obj;
end
return ShapeTextInput;