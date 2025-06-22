local composer = require("composer")
local scene = composer.newScene()
local json = require("json")

local link = "http://quixlasa.beget.tech/WOT/"





-- Глобальные переменные сцены (если нужны)
local sceneGroup  -- Основная группа для объектов сцены

width = display.contentWidth
height = display.contentHeight
local serverResponse = nil

bid = nil
myid = nil



-- create() - вызывается при создании сцены (первый раз или после перезагрузки)
function scene:create(event)
    sceneGroup = self.view  -- Создаем группу для объектов сцены


















local c_panel = display.newRoundedRect(
    width*0.5,  -- X
    height*0.5,  -- Y
    width*0.3,                     -- ширина
    width*0.3,                     -- высота
    width*0.02                       -- радиус скругления
)
c_panel:setFillColor(0.1, 0.1, 0.1) -- RGB (от 0 до 1)
sceneGroup:insert(c_panel)


c_nick = display.newText({
    text = name,             -- Текст, который будет отображён
    x = width*0.5,      -- Позиция по оси X (по центру экрана)
    y = height*0.3,       -- Позиция по оси Y (по центру экрана)
    font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
    fontSize = width*0.02                     -- Размер шрифта
})

c_nick:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
sceneGroup:insert(c_nick)



c_corp = display.newImage("images/tanks/c/"..data.tank..".png", width*0.5, height*0.475)
c_corp:scale(0.3, 0.3)
sceneGroup:insert(c_corp)

c_bashn = display.newImage("images/tanks/b/"..data.tank..".png", width*0.5, height*0.475)
c_bashn:scale(0.3, 0.3)
sceneGroup:insert(c_bashn)


local c_panel2 = display.newRoundedRect(
    width*0.85,  -- X
    height*0.15,  -- Y
    width*0.25,                     -- ширина
    width*0.05,                     -- высота
    width*0.02                       -- радиус скругления
)
c_panel2:setFillColor(0.1, 0.1, 0.1) -- RGB (от 0 до 1)
sceneGroup:insert(c_panel2)


c_txt1 = display.newText({
    text = "поиск противника ...",             -- Текст, который будет отображён
    x = width*0.85,      -- Позиция по оси X (по центру экрана)
    y = height*0.15,       -- Позиция по оси Y (по центру экрана)
    font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
    fontSize = width*0.0175                     -- Размер шрифта
})

c_txt1:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
sceneGroup:insert(c_txt1)

local c_btn1 = display.newRoundedRect(
    width*0.5,  -- X
    height*0.725,  -- Y
    width*0.2,                     -- ширина
    width*0.04,                    -- высота
    width*0.01                     -- радиус скругления
)
c_btn1:setFillColor(0.1, 0.5, 0.1) -- RGB (от 0 до 1)
sceneGroup:insert(c_btn1)

c_txt2 = display.newText({
    text = "играть с ботом",             -- Текст, который будет отображён
    x = width*0.5,      -- Позиция по оси X (по центру экрана)
    y = height*0.725,       -- Позиция по оси Y (по центру экрана)
    font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
    fontSize = width*0.0175                     -- Размер шрифта
})

c_txt2:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
sceneGroup:insert(c_txt2)

c_time_txt = display.newText({
    text = "0",             -- Текст, который будет отображён
    x = width*0.85,      -- Позиция по оси X (по центру экрана)
    y = height*0.25,       -- Позиция по оси Y (по центру экрана)
    font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
    fontSize = width*0.0175                     -- Размер шрифта
})

c_time_txt:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
sceneGroup:insert(c_time_txt)








function tapObj2(event)

local network = require("network")
local json = require("json")

local function networkListener4(event)
    if event.isError then
        print("Ошибка запроса:", event.response)
    else
        print("Ответ от сервера:", event.response)
    end
end

local url = link.."bot.php?bid="..bid
network.request(url, "GET", networkListener4)

return true
end




    c_btn1:addEventListener("tap", tapObj2)


















end

-- show() - вызывается при открытии сцены (каждый раз)
function scene:show(event)
    if event.phase == "will" then
        -- Сцена вот-вот появится (можно подготовить анимации)
    elseif event.phase == "did" then
        





function fetchDataC()
    network.request(
        link.."/battle/"..bid.."/2.txt",
        "GET",
        function(event)
            if not event.isError then
                --print("Получены данные:", event.response)
                if string.find(event.response, "<title>404 Not Found</title>") or 
                    string.find(event.response, "<h1>Not Found</h1>") then
                    print("find...")
                else
                    composer.gotoScene("scenes.battle")
                end
                
            else
                print("Ошибка запроса:", event.error)
            end
        end
    )
end

time = 0
c_time_txt.text = time

function TimeC2 ()
    time = time + 1
    if time >= 60 then
        tapObj2()
    end
    c_time_txt.text = time
end




timer.performWithDelay(1000, TimeC2, 0)



















local network = require("network")
local json = require("json")

local function networkListener5(event)
    if event.isError then
        print("Ошибка запроса:", event.response)
    else
        print("Ответ от сервера:", event.response)
            serverResponse = event.response

                local parts = {}
    for part in string.gmatch(serverResponse, "([^,]+)") do
        parts[#parts + 1] = part
    end

    -- Сохраняем в переменные
    if #parts >= 2 then
        bid = tonumber(parts[1])  -- Первое число (151370)
        myid = tonumber(parts[2]) -- Второе число (2)

        if myid == 1 then
            timer.performWithDelay(100, fetchDataC, 0)
        elseif myid == 2 then
            composer.gotoScene("scenes.battle")
        end
        
        print("bid =", bid, "myid =", myid)
    else
        print("Ошибка: неверный формат ответа")
    end
    end
end

local url = link.."connect.php?name="..name.."&pass="..pass
network.request(url, "GET", networkListener5)




        -- Сцена полностью показана (можно запускать таймеры, интерфейс)
    end
end

-- hide() - вызывается при скрытии сцены
function scene:hide(event)
    if event.phase == "will" then
        -- Сцена вот-вот исчезнет (удаляем временные объекты)
    elseif event.phase == "did" then
        -- Сцена полностью скрыта (останавливаем таймеры)
        timer.cancelAll()
    end
end

-- destroy() - вызывается при удалении сцены из памяти
function scene:destroy(event)
    -- Удаляем всё, что не удалилось автоматически
end

-- -----------------------------------------------------------------------------------
-- Прослушиватели событий сцены
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene