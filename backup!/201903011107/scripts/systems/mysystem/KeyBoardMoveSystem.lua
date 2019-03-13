_G.KeyBoardMoveSystem = System:DeriveClass("KeyBoardMoveSystem");

KeyBoardMoveSystem:SetRegisterCompo{
   "KeyBoard","Transform","Speed"
}

function KeyBoardMoveSystem:Update(dt)
	local iScene = self:GetCurScene();
	for _,tbLayer in pairs(iScene:GetRenderList()) do
		for _,iActor in ipairs(tbLayer) do 
			repeat
				if not self:GetRegisterCompo(iActor) then break end
				local iCompoTransform = iActor:GetiCompo("Transform");
                local iCompoKeyBoard = iActor:GetiCompo("KeyBoard");
                local iCompoSpeed = iActor:GetiCompo("Speed");
                if not iCompoKeyBoard.bActive then 
                    break;
                end
                if love.keyboard.isDown(iCompoKeyBoard.W) then 
                    iCompoTransform.y = iCompoTransform.y - iCompoSpeed.nSpeed * dt;
                end
                if love.keyboard.isDown(iCompoKeyBoard.A) then 
                    iCompoTransform.x = iCompoTransform.x - iCompoSpeed.nSpeed * dt;
                end
                if love.keyboard.isDown(iCompoKeyBoard.S) then 
                    iCompoTransform.y = iCompoTransform.y + iCompoSpeed.nSpeed * dt;
                end
                if love.keyboard.isDown(iCompoKeyBoard.D) then 
                    iCompoTransform.x = iCompoTransform.x + iCompoSpeed.nSpeed * dt;
                end
			until true
		end
	end 
end

function KeyBoardMoveSystem:SetActive(iActor,bActive)
    local iCompoKeyBoard = iActor:GetiCompo("KeyBoard");
    iCompoKeyBoard.bActive = bActive;
end