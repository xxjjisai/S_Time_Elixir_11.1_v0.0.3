_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler()
    self:Init(function ()
        self:Process_1();
    end)
end

function TheOridinaryWorld:Init(pfn) 

    if pfn then pfn() end
end

function TheOridinaryWorld:DestoryHandler()
    self:Init(function ()
        
    end)
end