_G.UILayerSortSystem = System:DeriveClass("UILayerSortSystem");

function UILayerSortSystem:Update(dt)
    local iScene = self:GetCurScene();
    local tbUIList = iScene:GetAllUI();
    table.sort(tbUIList, function(a,b)
        if a ~= nil and b ~= nil then 
            return a:GetAttr("nLayerIndex") < b:GetAttr("nLayerIndex")
        end
    end)
end

function UILayerSortSystem:SetLayerIndexHandler(iUI,nLayerIndex)
    if self.iCurUI then 
        self.iCurUI:SetAttr("nLayerIndex",nLayerIndex - 1);
    end
    iUI:SetAttr("nLayerIndex",nLayerIndex);
    self.iCurUI = iUI;
end