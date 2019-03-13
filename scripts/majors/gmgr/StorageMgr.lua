_G.StorageMgr = Class:DeriveClass("StorageMgr"); 

StorageMgr.tbRoleInfo = {};
StorageMgr.bStartPush = false;

StorageMgr.tbData = {};

function StorageMgr:Init()
    StorageMgr:ReadHandler()
end

function StorageMgr:InitHandler()
    self.tbData = {};
    return self.tbData; 
end

function StorageMgr:ReadHandler()
    local file = io.open('data.ext','rb');
    if file == nil then 
        return self:InitHandler();
    end
    file.close();
    local blob = Blob(file:read('*all'))
    self.tbData = blob:readTable(); 
    self:Trace(1,table.show(self.tbData,'self.tbData'));
    return self.tbData
end

function StorageMgr:PushHandler(value,pfn)
    table.insert(self.tbData, value);
    self:Trace(1,table.show(self.tbData,'self.tbData'));
    local blob = Blob();
    blob:writeTable(self.tbData);
    local file = io.open('data.ext', 'wb');
    file:write(blob:string());
    file:close();
    if pfn then pfn() end;
end

----------------------------------------------

function StorageMgr:Read()
    local file = io.open('data.ext','rb');
    if file == nil then 
        self:InitInfo();
        return self.tbRoleInfo;
    end
    local blob = Blob(file:read('*all'))
    local tbl = blob:readTable(); 
    file.close();
    self:Trace(1,"-----------------Storage Read Start-------------------");
    self:Trace(1,tbl);
    self:Trace(1,"----------------Storage Read Complete-----------------");
    self.tbRoleInfo = tbl;
    return tbl
end

function StorageMgr:GetInfo()
    return self.tbRoleInfo;
end

function StorageMgr:InitInfo()
    local tbInfo = PlayerModel:GetDataHandler() or {};
    self.tbRoleInfo = tbInfo;
    self:Push(); 
end

function StorageMgr:Push()
    if not Option.bStore then return  end
    self:Trace(1,"-----------------Storage Push Start-------------------");
    local blob = Blob();
    blob:writeTable(self.tbRoleInfo);
    local file = io.open('data.ext', 'wb')
    file:write(blob:string());
    file:close();
    self:Trace(1,self.tbRoleInfo);
    self:Read();
    self:Trace(1,"----------------Storage Push Complete-----------------");
end

function StorageMgr:ChangeValue(sType,nValue)
    self.tbRoleInfo[sType] = nValue;
    if not self.bStartPush then 
        self.bStartPush = true;
        Timer:after(1, function()
            self:Push();
            self.bStartPush = false;
        end) 
    end
end