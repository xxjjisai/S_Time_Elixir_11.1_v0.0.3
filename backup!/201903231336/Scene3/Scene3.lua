_G.Scene3 = GameChainSystem:DeriveClass('Scene3');

function Scene3:StartHandler()

    self.tbParent = {
        x = 100,
        y = 100,
        w = 100,
        h = 100;
    }

    UIMgr:CreateUI("ShapeButton", "btn_1")
    UIMgr:GetUI("btn_1"):SetAttr("y", self.tbParent.y)
    UIMgr:GetUI("btn_1"):SetAttr("sText", "btn1")

    UIMgr:CreateUI("ShapeButton", "btn_2")
    UIMgr:GetUI("btn_2"):SetAttr("y", self.tbParent.y + 100)
    UIMgr:GetUI("btn_2"):SetAttr("sText", "btn2")

    UIMgr:CreateUI("ShapeButton", "btn_3")
    UIMgr:GetUI("btn_3"):SetAttr("y", self.tbParent.y + 200)
    UIMgr:GetUI("btn_3"):SetAttr("sText", "btn3")

    UIMgr:CreateUI("ShapeButton", "btn_4")
    UIMgr:GetUI("btn_4"):SetAttr("y", self.tbParent.y + 300)
    UIMgr:GetUI("btn_4"):SetAttr("sText", "btn4")

    UIMgr:CreateUI("ShapeButton", "btn_5")
    UIMgr:GetUI("btn_5"):SetAttr("y", self.tbParent.y + 400)
    UIMgr:GetUI("btn_5"):SetAttr("sText", "btn5")

    UIMgr:CreateUI("ShapeButton", "btn_6")
    UIMgr:GetUI("btn_6"):SetAttr("y", self.tbParent.y + 500)
    UIMgr:GetUI("btn_6"):SetAttr("sText", "btn6")

    UIMgr:CreateUI("ShapePanel", "panel_1")
    UIMgr:GetUI("panel_1"):SetAttr("x", "100")
    UIMgr:GetUI("panel_1"):SetAttr("y", "100")
    UIMgr:GetUI("panel_1"):SetAttr("w", "300")
    UIMgr:GetUI("panel_1"):SetAttr("h", "300")
    UIMgr:GetUI("panel_1"):Init()
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_1"))
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_2"))
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_3"))
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_4"))
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_5"))
    UIMgr:GetUI("panel_1"):AddInPanel(UIMgr:GetUI("btn_6"))

end

function Scene3:Update(dt)

    local mx,my = love.mouse.getX(),love.mouse.getY();


    UIMgr:GetUI("panel_1").iChild.y = my * dt;
    self:Trace(1,UIMgr:GetUI("panel_1").iChild.y)

    -- UIMgr:GetUI("btn_1"):SetAttr("y", self.tbParent.y)
    -- UIMgr:GetUI("btn_2"):SetAttr("y", self.tbParent.y + 100)
    -- UIMgr:GetUI("btn_3"):SetAttr("y", self.tbParent.y + 200)
    -- UIMgr:GetUI("btn_4"):SetAttr("y", self.tbParent.y + 300)
    -- UIMgr:GetUI("btn_5"):SetAttr("y", self.tbParent.y + 400)
    -- UIMgr:GetUI("btn_6"):SetAttr("y", self.tbParent.y + 500)

end

function Scene3:DestoryHandler()

end