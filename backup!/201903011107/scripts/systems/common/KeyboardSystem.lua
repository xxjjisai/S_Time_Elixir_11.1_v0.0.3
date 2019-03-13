_G.KeyboardSystem = System:DeriveClass("KeyboardSystem");

KeyboardSystem:SetRegisterCompo{
   "KeyBoard"
}

function KeyboardSystem:Update(dt)
	local iScene = self:GetCurScene();
	for _,tbLayer in pairs(iScene:GetRenderList()) do
		for _,iActor in ipairs(tbLayer) do 
			repeat
				if not self:GetRegisterCompo(iActor) then break end
				if not iActor.bVisible then break end
				local iCompoKeyBoard = iActor:GetiCompo("KeyBoard");
                if not iCompoKeyBoard.bActive then 
                    break; 
                end
                if iCompoKeyBoard.Keys[]

			until true
		end
	end 
end