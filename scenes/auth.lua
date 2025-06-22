local composer = require("composer")
local scene = composer.newScene()
local json = require("json")
user_dt = 'dts'
local link = "http://quixlasa.beget.tech/WOT/"

local width = display.contentWidth
local height = display.contentHeight

name = ""
pass = ""

local panel
local bk1
local bk2
local btn1
local btnre
local inp1
local inp2
local info_txt
local txt


function scene:create(event)
    local sceneGroup = self.view


panel = display.newRoundedRect(
    width*0.5,  -- X
    height*0.5, -- Y
    width*0.3,  -- ширина
    width*0.3,  -- высота
    width*0.02  -- радиус скругления
)
panel:setFillColor(0.1, 0.1, 0.1)
sceneGroup:insert(panel)

bk1 = display.newRoundedRect(
    width*0.5,    -- X
    height*0.35,  -- Y
    width*0.25, -- ширина
    width*0.05, -- высота
    width*0.01  -- радиус скругления
)
bk1:setFillColor(0.2, 0.2, 0.2)
sceneGroup:insert(bk1)

bk2 = display.newRoundedRect(
    width*0.5,    -- X
    height*0.53,  -- Y
    width*0.25, -- ширина
    width*0.05, -- высота
    width*0.01  -- радиус скругления
)
bk2:setFillColor(0.2, 0.2, 0.2)
sceneGroup:insert(bk2)

btn1 = display.newRoundedRect(
    width*0.5,   -- X
    height*0.7,  -- Y
    width*0.25, -- ширина
    width*0.05, -- высота
    width*0.01  -- радиус скругления
)
btn1:setFillColor(0.2, 0.6, 0.3)
sceneGroup:insert(btn1)

btnre = display.newRoundedRect(
    width*0.7,   -- X
    height*0.7,  -- Y
    width*0.05, -- ширина
    width*0.05, -- высота
    width*0.01  -- радиус скругления
)
btnre:setFillColor(0.2, 0.6, 0.3)
sceneGroup:insert(btnre)

txt = display.newText({
    text = "authorization",
    x = width*0.5,
    y = height*0.7,
    font = native.systemFont,
    fontSize = width*0.02
})
txt:setFillColor(1, 1, 1)
sceneGroup:insert(txt)




info_txt = display.newText({
    text = "",
    x = width*0.5,
    y = height*0.9,
    font = native.systemFont,
    fontSize = width*0.02
})
info_txt:setFillColor(1, 0, 0)
sceneGroup:insert(info_txt)



end


function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот появится на экране
    elseif phase == "did" then
        -- Сцена полностью показана



inp1 = native.newTextField(width*0.5, height*0.35, width*0.2, width*0.04)
inp1:setTextColor(1, 1, 1)
inp1.hasBackground = false
inp1.font = native.newFont(native.systemFont, width*0.02)

inp2 = native.newTextField(width*0.5, height*0.53, width*0.2, width*0.04)
inp2:setTextColor(1, 1, 1)
inp2.hasBackground = false
inp2.font = native.newFont(native.systemFont, width*0.02)












local function networkListener(event)
    if event.isError then
        print("Ошибка запроса:", event.response)
        info_txt.text = event.response
    else
        print("Ответ от сервера:", event.response)
        if event.response ~= "чтото не верно!" and event.response ~= "этот аккаунт забанен!" and event.response ~= "никнейм заня!" and event.response ~= "у вас уже есть аккаунт" then
            user_dt = event.response
            print(user_dt)
            info_txt.text = ""
            --composer.removeScene("scenes.battle")
            composer.gotoScene("scenes.menu")
        else 
            info_txt.text = event.response
        end
    end
end

local function onObjectTap(event)
    if txt.text == "registration" then
        local url = link.."reg.php?name="..inp1.text.."&pass="..inp2.text
        network.request(url, "GET", networkListener)
        return true
    elseif txt.text == "authorization" then
        local url = link.."log.php?name="..inp1.text.."&pass="..inp2.text
        network.request(url, "GET", networkListener)
        return true
    end
end
btn1:addEventListener("tap", onObjectTap)
txt:addEventListener("tap", onObjectTap)




local function tapObj(event)
    if txt.text == "registration" then
        txt.text = "authorization"
    elseif txt.text == "authorization" then
        txt.text = "registration"
    end
    return true
end
btnre:addEventListener("tap", tapObj)



    end
end






function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот скроется
    elseif phase == "did" then


        if inp1 then
            name = inp1.text
            inp1:removeSelf()
            inp1 = nil
        end
        if inp2 then
            pass = inp2.text
            inp2:removeSelf()
            inp2 = nil
        end


    end
end




function scene:destroy(event)
    local sceneGroup = self.view
    -- Очистка объектов, таймеров, прослушивателей и т.д.
end

-- Подключение всех слушателей событий сцены
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
