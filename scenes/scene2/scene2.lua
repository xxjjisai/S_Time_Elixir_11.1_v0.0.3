_G.scene2 = GameChainSystem:DeriveClass("scene2");

function scene2:StartHandler()

    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1);

    local ox = 70;
    local offx = 20;
    local iw = 200;

    self.bTb = false;

    self.input_year = UIMgr:GetUI("input_year");
    self.input_year:SetAttr("x",ox );
    self.input_year:SetAttr("y",30 + offx );
    self.input_year:SetAttr("w",iw );
    self.btn_year = UIMgr:GetUI("btn_year");
    self.btn_year:SetAttr("x",self.input_year:GetAttr("x") + self.input_year:GetAttr("w") );
    self.btn_year:SetAttr("y",self.input_year:GetAttr("y") ); 
    self.btn_year:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_year:SetAttr("sText",tbCurTime_tmp.year );
    end); 
 
    self.input_month = UIMgr:GetUI("input_month");
    self.input_month:SetAttr("x",ox );
    self.input_month:SetAttr("y",offx + self.input_year:GetAttr("y") + self.input_year:GetAttr("h"));
    self.input_month:SetAttr("w",iw );
    self.btn_month = UIMgr:GetUI("btn_month");
    self.btn_month:SetAttr("x",self.input_month:GetAttr("x") + self.input_month:GetAttr("w") );
    self.btn_month:SetAttr("y",self.input_month:GetAttr("y") ); 
    self.btn_month:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_month:SetAttr("sText",tbCurTime_tmp.month );
    end); 
 
    self.input_day = UIMgr:GetUI("input_day");
    self.input_day:SetAttr("x",ox );
    self.input_day:SetAttr("y",offx + self.input_month:GetAttr("y") + self.input_month:GetAttr("h"));
    self.input_day:SetAttr("w",iw );
    self.btn_day = UIMgr:GetUI("btn_day");
    self.btn_day:SetAttr("x",self.input_day:GetAttr("x") + self.input_day:GetAttr("w") );
    self.btn_day:SetAttr("y",self.input_day:GetAttr("y") ); 
    self.btn_day:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_day:SetAttr("sText",tbCurTime_tmp.day );
    end); 
 
    self.input_hour = UIMgr:GetUI("input_hour");
    self.input_hour:SetAttr("x",ox );
    self.input_hour:SetAttr("y",offx + self.input_day:GetAttr("y") + self.input_day:GetAttr("h"));
    self.input_hour:SetAttr("w",iw );
    self.btn_hour = UIMgr:GetUI("btn_hour");
    self.btn_hour:SetAttr("x",self.input_hour:GetAttr("x") + self.input_hour:GetAttr("w") );
    self.btn_hour:SetAttr("y",self.input_hour:GetAttr("y") ); 
    self.btn_hour:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_hour:SetAttr("sText",tbCurTime_tmp.hour );
    end); 
 
    self.input_min = UIMgr:GetUI("input_min");
    self.input_min:SetAttr("x",ox );
    self.input_min:SetAttr("y",offx + self.input_hour:GetAttr("y") + self.input_hour:GetAttr("h"));
    self.input_min:SetAttr("w",iw );
    self.btn_min = UIMgr:GetUI("btn_min");
    self.btn_min:SetAttr("x",self.input_min:GetAttr("x") + self.input_min:GetAttr("w") );
    self.btn_min:SetAttr("y",self.input_min:GetAttr("y") ); 
    self.btn_min:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_min:SetAttr("sText",tbCurTime_tmp.min );
    end); 
 
    self.input_sec = UIMgr:GetUI("input_sec");
    self.input_sec:SetAttr("x",ox );
    self.input_sec:SetAttr("y",offx + self.input_min:GetAttr("y") + self.input_min:GetAttr("h"));
    self.input_sec:SetAttr("w",iw );
    self.btn_sec = UIMgr:GetUI("btn_sec");
    self.btn_sec:SetAttr("x",self.input_sec:GetAttr("x") + self.input_sec:GetAttr("w") );
    self.btn_sec:SetAttr("y",self.input_sec:GetAttr("y") ); 
    self.btn_sec:SetAttr("onClick",function ()
        local tbCurTime_tmp = os.date("*t", os.time());
        self.input_sec:SetAttr("sText",tbCurTime_tmp.sec );
    end); 
 
    self.btn_tb = UIMgr:GetUI("btn_tb");
    self.btn_tb:SetAttr("x",ox );
    self.btn_tb:SetAttr("y",offx + self.input_sec:GetAttr("y") + self.input_sec:GetAttr("h"));
    self.btn_tb:SetAttr("onClick",function ()
        self.bTb = not self.bTb;
        if self.bTb then 
            self.btn_tb:SetAttr("sText","停止" );
        else 
            self.btn_tb:SetAttr("sText","同步" );
        end
    end); 

    self.btn_qd = UIMgr:GetUI("btn_qd");
    self.btn_qd:SetAttr("x",ox + self.btn_tb:GetAttr("w") + 10 );
    self.btn_qd:SetAttr("y",self.btn_tb:GetAttr("y")); 
    self.btn_qd:SetAttr("onClick",function ()
        local str_year = self.input_year:GetAttr("sText")
        local str_month = self.input_month:GetAttr("sText")
        local str_day = self.input_day:GetAttr("sText")
        local str_hour = self.input_hour:GetAttr("sText")
        local str_min = self.input_min:GetAttr("sText")
        local str_sec = self.input_sec:GetAttr("sText")

        if  str_year == nil or str_year == "" or
            str_month == nil or str_month == "" or
            str_day == nil or str_day == "" or
            str_hour == nil or str_hour == "" or
            str_min == nil or str_min == "" or
            str_sec == nil or str_sec == "" 
            then 
                local title = "愚蠢！"
                local message = "都告诉你了不能有空着的你不信，这下报错了吧！不懂看下面\"?\"按钮中的帮助信息"
                local buttons = {"你不早说",escapebutton = 1}
                love.window.showMessageBox(title, message, buttons)
                return 
        end 

        local str_cmd1 = string.format("%s-%s-%s", str_year,str_month,str_day);
        local str_cmd2 = string.format("%s:%s:%s", str_hour,str_min,str_sec);
 
        local title = "确认要修改的时间"
		local message = '时间: '..str_cmd1.." "..str_cmd2
		local buttons = {"确认","我想改一下!",escapebutton = 2}
        local pressedbutton = love.window.showMessageBox(title, message, buttons)
		if pressedbutton == 1 then
			-- os.execute("runas /user:adminsitrator cmd.exe") 
			cmd1 = string.format("date %s",str_cmd1)
			cmd2 = string.format("time %s",str_cmd2)
			os.execute(cmd1)
			os.execute(cmd2)
		elseif pressedbutton == 2 then
			-- etc.
		end
    end); 

    self.btn_about = UIMgr:GetUI("btn_about");
    self.btn_about:SetAttr("x",ox + self.btn_qd:GetAttr("x") + 10 );
    self.btn_about:SetAttr("y",self.btn_qd:GetAttr("y"));
    self.btn_about:SetAttr("onClick",function ()
        local title = "关于"
		local message = "引擎：LÖVE 11.1 \n框架：Elixir\n作者：赵凯\n版本：v0.0.2"
		local buttons = {"嗯嗯",escapebutton = 1}
        love.window.showMessageBox(title, message, buttons)
    end); 

    self.btn_help = UIMgr:GetUI("btn_help");
    self.btn_help:SetAttr("x",self.btn_about:GetAttr("x")+self.btn_about:GetAttr("w")+10);
    self.btn_help:SetAttr("y",self.btn_about:GetAttr("y"));
    self.btn_help:SetAttr("onClick",function ()
        local title = "帮助"
		local message = "首先需要获取管理员权限\n直接输入年月日时分秒就行,不要有空着的！\n月份有30天、31天、28天和29天的，每天24小时，每小时60分钟，每分钟60秒，这都是常识！\n注意:我知道有很多bug,但请不要试图寻找bug，请正常使用，不听劝者设备会在10秒后爆炸！"
		local buttons = {"你猜我信不信",escapebutton = 1}
        love.window.showMessageBox(title, message, buttons) 
    end); 
    
    self.btn_net = UIMgr:GetUI("btn_net");
    self.btn_net:SetAttr("x",self.btn_help:GetAttr("x")+self.btn_help:GetAttr("w")+10);
    self.btn_net:SetAttr("y",self.btn_help:GetAttr("y"));
    self.btn_net:SetAttr("onClick",function () 
        local response_body = {};
        local res, code, response_headers = http.request ({
            method = "GET",
            -- url = "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp", -- 淘宝提供 {"api":"mtop.common.getTimestamp","v":"*","ret":["SUCCESS::接口调用成功"],"data":{"t":"1552469283800"}}
            url = "http://quan.suning.com/getSysTime.do", -- 苏宁提供 {"sysTime2":"2019-03-13 16:10:38","sysTime1":"20190313161038"}
            sink = ltn12.sink.table(response_body)
        })
        local tbJsonTime = json.decode(response_body[1]);
        local sNetTime = tbJsonTime.sysTime2; 
        local tbTime = string_split(sNetTime, " ");
        local str_cmd1, str_cmd2 = tbTime[1],tbTime[2]; 
        cmd1 = string.format("date %s",str_cmd1)
        cmd2 = string.format("time %s",str_cmd2)
        os.execute(cmd1) 
        os.execute(cmd2) 
        self:TongBu(); 
    end);  
    self:TongBu(); 
end

function scene2:Update(dt) 
    if not self.bTb then return end;
    local tbCurTime_tmp = os.date("*t", os.time());
    self.input_year:SetAttr("sText",tbCurTime_tmp.year );
    self.input_month:SetAttr("sText",tbCurTime_tmp.month );
    self.input_day:SetAttr("sText",tbCurTime_tmp.day );
    self.input_hour:SetAttr("sText",tbCurTime_tmp.hour );
    self.input_min:SetAttr("sText",tbCurTime_tmp.min );
    self.input_sec:SetAttr("sText",tbCurTime_tmp.sec );
end

function scene2:TongBu()
    local tbCurTime_tmp = os.date("*t", os.time());
    self.input_year:SetAttr("sText",tbCurTime_tmp.year );
    self.input_month:SetAttr("sText",tbCurTime_tmp.month );
    self.input_day:SetAttr("sText",tbCurTime_tmp.day );
    self.input_hour:SetAttr("sText",tbCurTime_tmp.hour );
    self.input_min:SetAttr("sText",tbCurTime_tmp.min );
    self.input_sec:SetAttr("sText",tbCurTime_tmp.sec );
    if self.bTb then 
        self.btn_tb:SetAttr("sText","停止" );
    else 
        self.btn_tb:SetAttr("sText","同步" );
    end 
end 