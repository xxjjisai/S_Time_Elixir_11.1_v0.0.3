local PlayerBulletConfig = 
{
    ["Transform"] = { x=0, y=0, w=30, h=55, sx=1, sy=1, ox=0, oy=0, r=0 };
    ["Color"] = { r = 1, g = 1, b = 1, a = 1 };
    ["RenderLayer"] = { nLayerIndex = RenderLayerType.nPlayer };
    ["ShootBullet"] = { nBulletType = "player" };
    -- ["Rectangle"] = { sFillType = "fill"};
    -- ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, nTotalFrame= 5, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
    ["Animate"] = { sImg = "tc", nQuadW = 30, nQuadH = 55, nTotalFrame= 18, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
}
return PlayerBulletConfig