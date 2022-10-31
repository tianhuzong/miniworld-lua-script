-- description: script code
--{{ 亲爱的冒险家：发布违规信息、社交软件及传播诱导类信息会被关小黑屋哦 }}

--------------------------------------------------------------------
--{{{ 游戏开始，执行一次  <game start> run once!
--### template : 初始化  init ###  
--[==[ 定义lua变量,执行开发者API等   
local msg = 'hello, mini world!'
Game:msgBox(msg)
--]==]

--### template : 注册触发器   register tigger ###
--[==[ 使用表情动作，弹消息[msg]  
local function func_event(param)
    local playerid = CurEventParam.TriggerByPlayer
    if playerid then
        local ret, name = Player:getNickname(playerid)
        if ret == ErrorCode.OK then
            Chat:sendSystemMsg('[' .. name .. '] say mini')
        end
    end
end
ScriptSupportEvent:registerEvent('Player.PlayAction', func_event)
--]==]
--}}}

--------------------------------------------------------------------
--{{{ 游戏时钟，每时钟(50ms)执行一次  <game tick> run once per tick!
--[==[
local bloodtick = 0
return function()
    -- 房主每秒回复1点血   
    bloodtick = bloodtick + 1
    if bloodtick >= 20 then
        bloodtick = 0

        local playerid = 0 -- 房主
        local ret, hp = Player:getAttr(playerid, PLAYERATTR.CUR_HP)
        if ret == ErrorCode.OK then
            hp = hp + 1
            Player:setAttr(playerid, PLAYERATTR.CUR_HP, hp)
        end
    end
end
--]==]
--}}}
