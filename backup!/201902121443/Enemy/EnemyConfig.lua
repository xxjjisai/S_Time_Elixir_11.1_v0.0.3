local EnemyConfig = 
{
    ["Transform"] = { x=0, y=0, w=32, h=32, sx=1, sy=1, ox=0, oy=0, r=0 };
    ["Color"] = { r = 1, g = 1, b = 1, a = 1 };
    ["RenderLayer"] = { nLayerIndex = RenderLayerType.nFloor };
    ["ClickScale"] = {};
    -- ["Rectangle"] = { sFillType = "line"};
    -- ["Sprite"] = { sImg = "hero_001" };
    ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, nTotalFrame= 5, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
    -- ["Animate"] = { sImg = "tc", nQuadW = 30, nQuadH = 55, nTotalFrame= 18, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
    -- ["Animate"] = { sImg = "hero_ani", nQuadW = 64, nQuadH = 128, nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
}
return EnemyConfig