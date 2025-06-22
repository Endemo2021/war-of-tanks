local composer = require("composer")
local scene = composer.newScene()
local json = require("json")

data = 0
local link = "http://quixlasa.beget.tech/WOT/"



width = display.contentWidth
height = display.contentHeight

-- Создание сцены (всё, что нужно отрисовать — сюда)
function scene:create(event)
    local sceneGroup = self.view
    -- Здесь можно разместить графику, кнопки и т.д.

    if user_dt then
    data = json.decode(user_dt)
    end



    m_panel = display.newRoundedRect(
    width*0.5,  -- X
    height*0.05,  -- Y
    width*1.5,                     -- ширина
    width*0.1,                     -- высота
    width*0.02                       -- радиус скругления
    )
    m_panel:setFillColor(0.1, 0.1, 0.1) -- RGB (от 0 до 1)
    sceneGroup:insert(m_panel)



    m_btn1 = display.newRoundedRect(
    width*0.5,  -- X
    height*0.08,  -- Y
    width*0.15,                     -- ширина
    width*0.05,                     -- высота
    width*0.01                       -- радиус скругления
    )
    m_btn1:setFillColor(0.7, 0.3, 0.3) -- RGB (от 0 до 1)
    sceneGroup:insert(m_btn1)

    m_bk = display.newRoundedRect(
    width*0.12,  -- X
    height*0.65,  -- Y
    width*0.15,                     -- ширина
    width*0.03,                     -- высота
    width*0.005                       -- радиус скругления
    )
    m_bk:setFillColor(0.1, 0.1, 0.1) -- RGB (от 0 до 1)
    sceneGroup:insert(m_bk)

    m_btn2 = display.newRoundedRect(
    width*0.24,  -- X
    height*0.65,  -- Y
    width*0.06,                     -- ширина
    width*0.03,                     -- высота
    width*0.005                       -- радиус скругления
    )
    m_btn2:setFillColor(0.1, 0.1, 0.1) -- RGB (от 0 до 1)
    sceneGroup:insert(m_btn2)


    m_txt1 = display.newText({
        text = "battle",             -- Текст, который будет отображён
        x = width*0.5,      -- Позиция по оси X (по центру экрана)
        y = height*0.08,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

    m_txt1:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
    sceneGroup:insert(m_txt1)

m_icn = display.newCircle( width*0.05, height*0.08, width*0.025 )  -- x=150, y=300, радиус=75
m_icn:setFillColor( 0.3, 0.3, 0.3)
  sceneGroup:insert(m_icn)


 m_nick = display.newText({
        text = "nickname",             -- Текст, который будет отображён
        x = width*0.1,      -- Позиция по оси X (по центру экрана)
        y = height*0.08,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                   -- Размер шрифта
    })
    m_nick:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
    m_nick.anchorX = 0
    sceneGroup:insert(m_nick)


  







  -- Настройки текста (общие для всех)
local textSettings = {
    font = native.systemFont,  -- Шрифт
    fontSize = width*0.018,            -- Размер
    align = "left"            -- Выравнивание слева
}

-- Координаты для каждого текста (x, y)
local textPositions = {
    { x = width*0.05,  y = height*0.53 },
    { x = width*0.05,  y = height*0.45 },
    { x = width*0.05,  y = height*0.37 },
    { x = width*0.05,  y = height*0.29 },
    { x = width*0.05,  y = height*0.21 }
}

-- Таблица для хранения текстовых объектов
local texts = {}

-- Создаем 5 текстов в цикле
for i = 1, 5 do
    texts[i] = display.newText({
        text = "Текст " .. i,  -- Текст с номером
        x = textPositions[i].x,
        y = textPositions[i].y,
        font = textSettings.font,
        fontSize = textSettings.fontSize,
        align = textSettings.align
    })
    texts[i].anchorX = 0
    sceneGroup:insert(texts[i])
end


m_shop_icn = display.newImage("images/ui/shop.png", width*0.95, height*0.08)
m_shop_icn:scale(0.05, 0.05)
sceneGroup:insert(m_shop_icn)

m_tanks_icn = display.newImage("images/ui/tanks.png", width*0.38, height*0.08)
m_tanks_icn:scale(0.05, 0.05)
sceneGroup:insert(m_tanks_icn)

m_users_icn = display.newImage("images/ui/users.png", width*0.31, height*0.08)
m_users_icn:scale(0.05, 0.05)
sceneGroup:insert(m_users_icn)

m_inv_icn = display.newImage("images/ui/inventar.png", width*0.24, height*0.08)
m_inv_icn:scale(0.05, 0.05)
sceneGroup:insert(m_inv_icn)



m_corp = display.newImage("images/tanks/c/"..data.tank..".png", width*0.5, height*0.475)
m_corp:scale(0.3, 0.3)
m_corp.rotation = -70
sceneGroup:insert(m_corp)

m_bashn = display.newImage("images/tanks/b/"..data.tank..".png", width*0.5, height*0.475)
m_bashn:scale(0.3, 0.3)
m_bashn.rotation = -70
sceneGroup:insert(m_bashn)



m_silv_icn = display.newCircle( width*0.875, height*0.08, width*0.01 )  -- x=150, y=300, радиус=75
m_silv_icn:setFillColor( 0.5, 0.5, 0.5)
sceneGroup:insert(m_silv_icn)

m_gold_icn = display.newCircle( width*0.725, height*0.08, width*0.01 )  -- x=150, y=300, радиус=75
m_gold_icn:setFillColor( 0.9, 0.9, 0)
sceneGroup:insert(m_gold_icn)


m_silv_txt = display.newText({
        text = "1000",             -- Текст, который будет отображён
        x = width*0.85,      -- Позиция по оси X (по центру экрана)
        y = height*0.08,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

m_silv_txt:setFillColor(1, 1, 1)
m_silv_txt.anchorX = 1
sceneGroup:insert(m_silv_txt)

if data ~= 0 then
    m_silv_txt.text = data.silver
end

m_gold_txt = display.newText({
        text = "100",             -- Текст, который будет отображён
        x = width*0.7,      -- Позиция по оси X (по центру экрана)
        y = height*0.08,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

m_gold_txt:setFillColor(1, 1, 1)
m_gold_txt.anchorX = 1
sceneGroup:insert(m_gold_txt)

if data ~= 0 then
    m_gold_txt.text = data.gold
end


local imageFill = {
    type = "image",
    filename = "images/slots/0.png"  -- путь к изображению
}

-- Применение изображения как заливки











local widget = require("widget")
local json = require("json")
local network = require("network")

-- Функция для отправки GET-запроса
local function sendGetRequest(slotNumber, spriteNumber)
    local url = link.."vtank.php?name="..name.."&pass="..pass.."&tank="..tostring(slotNumber)
    print("Отправка запроса:", url)
    
    network.request(url, "GET", function(event)
        if event.isError then
            print("Ошибка запроса:", event.response)
        else
            print("Ответ сервера:", event.response)
            local response = json.decode(event.response)
            
            -- Удаляем старые изображения если они существуют
            if m_corp then
                display.remove(m_corp)
                m_corp = nil
            end
            if m_bashn then
                display.remove(m_bashn)
                m_bashn = nil
            end
            
            -- Создаем новые изображения с номером спрайта (spriteNumber)
            m_corp = display.newImage("images/tanks/c/"..tostring(spriteNumber)..".png", width*0.5, height*0.475)
            m_corp:scale(0.3, 0.3)
            m_corp.rotation = -70
            sceneGroup:insert(m_corp)
            
            m_bashn = display.newImage("images/tanks/b/"..tostring(spriteNumber)..".png", width*0.5, height*0.475)
            m_bashn:scale(0.3, 0.3)
            m_bashn.rotation = -70
            sceneGroup:insert(m_bashn)
        end
    end)
end

-- Создаем ScrollView
scrollView = widget.newScrollView({
    top = width * 0.31,
    left = 0,
    width = display.contentWidth,
    height = height * 0.31,
    scrollWidth = width,
    scrollHeight = 200,
    horizontalScrollDisabled = false,
    verticalScrollDisabled = true,
    backgroundColor = { 0.9, 0.9, 0.9, 0 }
})

local itemsCount = 25
local itemSize = width * 0.09
local spacing = width * 0.02

for i = 1, itemsCount do
    local square = display.newRoundedRect(
        (itemSize + spacing) * (i - 0.5),
        width * 0.075,
        itemSize,
        itemSize,
        0
    )
    square:setFillColor(0.1, 0.1, 0.1)

    local fieldName = "slot" .. i
    local m_slot = data[fieldName]  -- Получаем номер спрайта из данных
    --print("Слот", i, "Спрайт", m_slot)

    square.fill = { type = "image", filename = "images/slots/" .. m_slot .. ".png" }
    
    -- Добавляем обработчик нажатия
    square:addEventListener("tap", function()
        print("Нажат слот:", i, "Номер спрайта:", m_slot)
        -- Отправляем номер слота (i), но используем номер спрайта (m_slot) для изображений
        
        if m_slot ~= 0 then
            sendGetRequest(i, m_slot)
        end
    end)

    sceneGroup:insert(square)
    scrollView:insert(square)
end









function tapObj(event)

    composer.gotoScene("scenes.connect")

return true
end




    m_btn1:addEventListener("tap", tapObj)









local json = require("json")  -- Для обработки JSON (если API возвращает JSON)
local textsArray = {}         -- Массив, куда будем добавлять тексты

-- Функция для отправки GET-запроса и обработки ответа
function fetchData()
    network.request(
        link.."messages.txt",  -- Замените на ваш URL
        "GET",
        function(event)
            if not event.isError then
                local response = event.response
                --print("Получены данные:", response)

                -- Разделяем строку по запятым (если ответ в формате "текст1,текст2,текст3")
                local texts2 = {}
                for text in string.gmatch(response, "([^,]+)") do
                    table.insert(texts2, text)
                end

                -- Берем первые 5 элементов (или меньше, если их недостаточно)
                for i = 1, math.min(5, #texts2) do
                    table.insert(textsArray, texts2[i])
                    texts[i].text = texts2[i]
                    --print("Добавлен текст:", texts2[i])
                end

                -- Выводим текущий массив (для проверки)
                --print("Текущий массив textsArray:", table.concat(textsArray, ", "))
            else
                print("Ошибка запроса:", event.error)
            end
        end
    )
end











local json = require("json")


-- Обработчик ответа от сервера
local function networkListenerM(event)
    if event.isError then
        print("Ошибка запроса:", event.response)
    else
        print("Ответ от сервера:", event.response)

        -- Если JSON:
        -- local data = json.decode(event.response)
        -- print("Например: ", data.someKey)
    end
end

-- Функция при касании объекта
local function onObjectTapM(event)
        local url = link.."send.php?name="..name.."&pass="..pass.."&sms="..m_inp1.text  -- замени на свой URL
        m_inp1.text = ""
        network.request(url, "GET", networkListenerM)
        return true
end

-- Назначение обработчика касания объекту
m_btn2:addEventListener("tap", onObjectTapM)















end

-- Показ сцены (можно реагировать на фазы: will/did)
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот появится на экране
    elseif phase == "did" then
        -- Сцена полностью показана




timer.performWithDelay(1000, fetchData, 0)




        scrollView.isVisible = true

        if name then
            m_nick.text = name
        end




        m_inp1 = native.newTextField(width*0.12, height*0.65, width*0.14, width*0.025)
        m_inp1:setTextColor(1, 1, 1)
        m_inp1.hasBackground = false
        m_inp1.font = native.newFont(native.systemFont, width*0.015)







    end
end

-- Скрытие сцены (можно реагировать на фазы: will/did)
function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот скроется
    elseif phase == "did" then
        -- Сцена полностью скрыта

        timer.cancelAll()

        scrollView.isVisible = false





        if m_inp1 then
            m_inp1:removeSelf()
            m_inp1 = nil
        end
    end
end

-- Удаление сцены (освобождение ресурсов)
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
