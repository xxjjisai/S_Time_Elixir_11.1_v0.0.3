_G.Include = Class:DeriveClass("Include");

package.path = ""
package.cpath = (os.getenv ("LUA_CLIBRARY_PATH") or ".") .. "/libs/?.dll"

function Include:RequireHandler(strDir,sPath)
    self:Trace(1,"do file: [",strDir..sPath,"]");
    require(strDir..sPath);
end

function Include:Import(pfn)
    self:GlobalConfig();
    self:ThirdPartyLibrary();
    self:GlobalManager();
    self:GlobalSystem();
    self:GlobalModel(); 
    self:Trace(1," *** Do File Complete! *** ");
    pfn(0,nil);
end

function Include:ThirdPartyLibrary()
    local strDir = "libs/";
    loader      	    = require(strDir..'love-loader');
    bump_debug      	= require(strDir..'bump_debug'); 
    bump      	        = require(strDir..'bump'); 
    json      	        = require(strDir..'json'); 
    splash      	    = require(strDir..'lovesplash');
    Timer               = require(strDir.."Timer")();
    Camera              = require(strDir.."Camera")();
    Blob                = require(strDir.."Blob");
    Utils               = require(strDir.."Utils");
    Katsudo             = require(strDir.."katsudo");
    Tween               = require(strDir.."tween/tween");
    utf8                = require("utf8");
    -- nuklear             = require("nuklear");
    socket              = require("socket");
    http                = require("socket.http")
end

function Include:GlobalManager()
    local strDir = "scripts/majors/gmgr/";
    self:RequireHandler(strDir,"GameMgr");
    self:RequireHandler(strDir,"AssetsMgr");
    self:RequireHandler(strDir,"MenuMgr");
    self:RequireHandler(strDir,"GuoDuMgr");
    self:RequireHandler(strDir,"SceneMgr");
    self:RequireHandler(strDir,"ActorMgr");
    self:RequireHandler(strDir,"ContentMgr");
    self:RequireHandler(strDir,"StorageMgr");
    self:RequireHandler(strDir,"CameraMgr");
    self:RequireHandler(strDir,"PauseMgr");
    self:RequireHandler(strDir,"OverMgr");
    self:RequireHandler(strDir,"UIMgr");
end 

function Include:GlobalConfig()
    local strDir = "configs/";

    local assetsCfgStrDir = strDir.."assetscfgs/";
    self:RequireHandler(assetsCfgStrDir,"AssetsFontCfg");
    self:RequireHandler(assetsCfgStrDir,"AssetsTextureCfg");
    self:RequireHandler(assetsCfgStrDir,"AssetsVoiceCfg");

    local gamesCfgStrDir = strDir.."gamecfgs/";
    self:RequireHandler(gamesCfgStrDir,"GameTypeCfg");
    self:RequireHandler(gamesCfgStrDir,"GameTextCfg");
    self:RequireHandler(gamesCfgStrDir,"GameDataCfg");

end

function Include:GlobalSystem()
    local strCommonDir = "scripts/systems/common/";
    self:RequireHandler(strCommonDir,"RectangleRenderSystem");
    self:RequireHandler(strCommonDir,"LayerSortSystem");
    self:RequireHandler(strCommonDir,"SpriteRenderSystem");
    self:RequireHandler(strCommonDir,"AnimationSystem");
    self:RequireHandler(strCommonDir,"GameChainSystem");
    self:RequireHandler(strCommonDir,"UILayerSortSystem");

    local strMysystemDir = "scripts/systems/mysystem/";
    -- self:RequireHandler(strMysystemDir,"KeyBoardMoveSystem"); 

end

function Include:GlobalModel()
    local strDir = "scripts/models/";
    self:RequireHandler(strDir,"PlayerModel");
end

function Include:SceneSystemAndCfg(nSceneID)
    local strDir = string.format("scenes/scene%s/",tostring(nSceneID));
    local strSysFileName = string.format("Scene%s",tostring(nSceneID));
    local strCfgFileName = string.format("Scene_%s",tostring(nSceneID));
    self:RequireHandler(strDir,strSysFileName);
    self:RequireHandler(strDir,strCfgFileName);
end