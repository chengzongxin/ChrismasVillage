-- 爆率物品池
ItemPool = nil
-- 刷怪AI池
AIPool = nil
-- 抽奖物品池
LotteryPool = nil
-- 刷怪单位ID
AI_LIST_IDS = {str2id('n000:nsca'),str2id('u000:uske'),str2id('u001:uskm')}
-- 物品ID
SWORD_LIST_IDS = {str2id('I002:asbl'),str2id('I001:frgd'),str2id('I000:srbd'),str2id('I00C:srbd')}
ARMOR_LIST_IDS = {str2id('I003:blba'),str2id('I005:shhn'),str2id('I004:shdt'),str2id('I00B:shdt')}
RING_LIST_IDS = {str2id('I00A:lnrn'),str2id('I007:sprn'),str2id('I00F:rnsp'),str2id('I009:rnsp')}
JIEJIN_ID = str2id('I008:engs')
-- 技能被动
SKILL_LIST_ITEM_IDS = {
    str2id('I00H:phea'), -- 荆棘
    str2id('I00J:phea'), -- 耐久
    str2id('I00G:phea'), -- 专注
    str2id('I00I:phea'), -- 命令
    }
SKILL_LIST_IDS = {
    str2id('A00P:AEah'), -- 荆棘
    str2id('A00N:AOae'), -- 耐久
    str2id('A00O:AHad'), -- 专注
    str2id('A00Q:ACac'), -- 命令
    }

SKILL_LIST_IDS_MAP = {}

local function SKILL_LIST_IDS_MAP_init()
    if #SKILL_LIST_ITEM_IDS ~= #SKILL_LIST_IDS then
        echo("技能物品和技能数目不一致！！！！！！！！！！！！！！！")
    end
    for i = 1, #SKILL_LIST_ITEM_IDS do
        SKILL_LIST_IDS_MAP[SKILL_LIST_ITEM_IDS[i]] = SKILL_LIST_IDS[i]
    end
end


local function playerGroup_init()
    PlayerGroup = Players.new()
    -- 循环遍历玩家数
    for i = 0, MAX_PLAYER_QTY - 1 do
        local p = cj.Player(i)
        -- 玩家的控制者是用户，并且游戏状态是正在游戏
        if cj.GetPlayerController(p) == cj.MAP_CONTROL_USER and cj.GetPlayerSlotState(p) == cj.PLAYER_SLOT_STATE_PLAYING then
            print(cj.GetPlayerName(p).." Player Controller is : "..cj.GetPlayerController(p).."  slot state : "..cj.GetPlayerSlotState(p).."handle : "..p)
            -- 全局初始化
            local player = Player.new(p)
            player:addGold(200)
            PlayerGroup:put(player)
        end
    end
    -- 查询完成
    local pcount = PlayerGroup.count
    print("print all players,count = "..pcount)
    for _, idx in pairs(PlayerGroup.playerIndexs) do
        local countStr = string.format( " |cffffff00%d|r ", pcount)
        echo("本局游戏玩家数量为"..countStr.."人",PlayerGroup:GetWithIndex(idx).handle,30,0,0)
    end
end

-- 物品池掉落结晶、装备、被动技能
local function itemPool_init()
    local ip = cj.CreateItemPool()
    cj.ItemPoolAddItemType(ip,JIEJIN_ID,20)
    cj.ItemPoolAddItemType(ip,SWORD_LIST_IDS[1],1)
    cj.ItemPoolAddItemType(ip,ARMOR_LIST_IDS[1],1)
    cj.ItemPoolAddItemType(ip,RING_LIST_IDS[1],1)
    for index, player in ipairs(SKILL_LIST_ITEM_IDS) do
        cj.ItemPoolAddItemType(ip,player,1)
    end
    ItemPool = ip
end
-- 刷怪池
local function AIPool_init()
    local aip = cj.CreateUnitPool()
    for _, player in ipairs(AI_LIST_IDS) do
        cj.UnitPoolAddUnitType(aip, player, 1)
    end
    AIPool = aip
end
-- 抽奖池
local function lottery_pool_init()
    local lp = cj.CreateItemPool()
    cj.ItemPoolAddItemType(lp,JIEJIN_ID,20)
    LotteryPool = lp
end


function GAME_INIT()
    playerGroup_init()
    itemPool_init()
    AIPool_init()
    SKILL_LIST_IDS_MAP_init()
    lottery_pool_init()
end
