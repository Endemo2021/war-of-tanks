-- scene1.lua
local composer = require("composer")
local scene = composer.newScene()
system.activate("multitouch")
local physics = require("physics")
physics.start()
physics.setGravity(0, 0) -- Если не нужна гравитация


local width = display.contentWidth
local height = display.contentHeight




local dj_bk1
local dj_bk2
local dj1
local dj2
local corp1
local bashn1
local nik1
local nik2
local leftDirection, rightDirection
local bullet
local turnSpeed = 1

local TankUpdate

local activeTouches = {}

-- print("bid: "..bid)
-- print("myid "..myid)
-- print("name "..name)
-- print("pass "..pass)

-- bid = "497124"
-- myid = "1"
link = "http://quixlasa.beget.tech/WOT/"
-- name = "Stiv"
-- pass = "abrams"



-- Фаза создания сцены
function scene:create(event)
    local sceneGroup = self.view
    -- Здесь можно добавлять объекты








bullet = display.newRoundedRect(
    width*0.5,    -- X
    height*0.53,  -- Y
    width*0.01, -- ширина
    width*0.01, -- высота
    width*0.01  -- радиус скругления
)
bullet:setFillColor(0, 0, 0)
sceneGroup:insert(bullet)









corp1 = display.newImage("images/tanks/c/1.png", width*0.1, height*0.5)
corp1:scale(0.2, 0.2)
sceneGroup:insert(corp1)

bash1 = display.newImage("images/tanks/b/1.png", width*0.1, height*0.5)
bash1:scale(0.2, 0.2)
sceneGroup:insert(bash1)


corp2 = display.newImage("images/tanks/c/1.png", width*0.9, height*0.5)
corp2:scale(0.2, 0.2)
corp2.rotation = -180
sceneGroup:insert(corp2)

bash2 = display.newImage("images/tanks/b/1.png", width*0.9, height*0.5)
bash2:scale(0.2, 0.2)
bash2.rotation = -180
sceneGroup:insert(bash2)





physics.addBody(bullet, "dynamic", { radius=20, isSensor=true })
physics.addBody(corp1, "static", { isSensor=true })
physics.addBody(corp2, "static", { isSensor=true })
bullet.name = "bullet"
corp1.name = "corp1"
corp2.name = "corp2"



local function onCollision(event)
    if event.phase == "began" then
        print("Соприкосновение между", event.object1.name, "и", event.object2.name)
    end
end

Runtime:addEventListener("collision", onCollision)









dj_bk1 = display.newCircle(width*0.15, height*0.75, width*0.075)
dj_bk1:setFillColor(0, 0, 0, 0.5)

dj_bk2 = display.newCircle(width*0.85, height*0.75, width*0.075)
dj_bk2:setFillColor(0, 0, 0, 0.5)

dj1 = display.newCircle(width*0.15, height*0.75, width*0.05)
dj1:setFillColor(0, 0, 0)

dj2 = display.newCircle(width*0.85, height*0.75, width*0.05)
dj2:setFillColor(0, 0, 0)




    nik1 = display.newText({
        text = "nickname1",             -- Текст, который будет отображён
        x = corp1.x,      -- Позиция по оси X (по центру экрана)
        y = corp1.y-width*0.05,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

    nik1:setFillColor(0, 1, 0)   -- Цвет текста (RGB)
    sceneGroup:insert(nik1)

    hp1_txt = display.newText({
        text = "1500",             -- Текст, который будет отображён
        x = corp1.x,      -- Позиция по оси X (по центру экрана)
        y = corp1.y-width*0.02,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

    hp1_txt:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
    sceneGroup:insert(hp1_txt)


    nik2 = display.newText({
        text = "nickname2",             -- Текст, который будет отображён
        x = corp2.x,      -- Позиция по оси X (по центру экрана)
        y = corp2.y-width*0.05,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

    nik2:setFillColor(1, 0, 0)   -- Цвет текста (RGB)
    sceneGroup:insert(nik2)

    hp2_txt = display.newText({
        text = "1500",             -- Текст, который будет отображён
        x = corp2.x,      -- Позиция по оси X (по центру экрана)
        y = corp2.y-width*0.02,       -- Позиция по оси Y (по центру экрана)
        font = native.systemFont,         -- Шрифт (можно использовать системный шрифт)
        fontSize = width*0.02                     -- Размер шрифта
    })

    hp2_txt:setFillColor(1, 1, 1)   -- Цвет текста (RGB)
    sceneGroup:insert(hp2_txt)









local function Fire()
    print("Fire")
end
































local move = 0



local activeTouches = {}

local function onTouch(event)
    local id = event.id  -- уникальный ID пальца
    local target = event.target

    if event.phase == "began" then
        display.currentStage:setFocus(target, id)
        target.isFocus = true
        activeTouches[id] = target
    elseif event.phase == "moved" then
        target.x = event.x
        target.y = event.y
        if target == dj1 then
            local dx = target.x - dj_bk1.x
            local dy = target.y - dj_bk1.y
            local distance = math.sqrt(dx * dx + dy * dy)
            local nx = dx / distance
            local ny = dy / distance
            local newPx = dj_bk1.x + nx * width*0.075
            local newPy = dj_bk1.y + ny * width*0.075
            if distance > width*0.075 then
                target.x = newPx
                target.y = newPy
            end

            local dx = target.x - dj_bk1.x
            local dy = target.y - dj_bk1.y
            local angle = math.atan2(dy, dx)
            local leftDirection = math.deg(angle)
            if leftDirection > (-135) and leftDirection < (-50) then
                move = 1
            elseif leftDirection < (-135) or leftDirection > 135 then
                move = -2
            elseif leftDirection < (45) and leftDirection > -45 then
                move = 2
            elseif leftDirection < (135) and leftDirection > 45 then
                move = -1
            end


        
        elseif target == dj2 then
            local dx = target.x - dj_bk2.x
            local dy = target.y - dj_bk2.y
            local distance = math.sqrt(dx * dx + dy * dy)
            local nx = dx / distance
            local ny = dy / distance
            local newPx = dj_bk2.x + nx * width*0.075
            local newPy = dj_bk2.y + ny * width*0.075
            if distance > width*0.075 then
                target.x = newPx
                target.y = newPy
            end
            local dx = target.x - dj_bk2.x
            local dy = target.y - dj_bk2.y

            local angle = math.atan2(dy, dx)
            local rightDirection = math.deg(angle)

            bash1.rotation = rightDirection




        end
    elseif event.phase == "ended" or event.phase == "cancelled" then
        if target == dj1 then
            target.x = dj_bk1.x
            target.y = dj_bk1.y
            move = 0
        elseif target == dj2 then
            target.x = dj_bk2.x
            target.y = dj_bk2.y
            Fire()
        end
    end

    return true
end

dj1:addEventListener("touch", onTouch)
dj2:addEventListener("touch", onTouch)






local mv1 = 0
local mv2 = 0



function explode(delimiter, text)
    local result = {}
    for match in (text .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end



local json = require("json")  -- Для обработки JSON (если API возвращает JSON)влять тексты

-- Функция для отправки GET-запроса и обработки ответа
function fetchData()
    network.request(
        link.."battle/"..bid.."/1.txt",  -- Замените на ваш URL
        "GET",
        function(event)
            if not event.isError then
                local response = event.response
                --print("Получены данные:", response)
                local datesArray = explode(",", response)
                mv1 = datesArray[4]
                nik1.text = datesArray[1]
                hp1_txt.text = datesArray[3]
            else
                print("Ошибка запроса:", event.error)
            end
        end
    )
end




local json = require("json")  -- Для обработки JSON (если API возвращает JSON)влять тексты

-- Функция для отправки GET-запроса и обработки ответа
function fetchData2()
    network.request(
        link.."battle/"..bid.."/2.txt",
        "GET",
        function(event)
            if not event.isError then
                local response = event.response
                --print("Получены данные:", response)
                local datesArray = explode(",", response)
                mv2 = datesArray[4]
                nik2.text = datesArray[1]
                hp2_txt.text = datesArray[3]
            else
                print("Ошибка запроса:", event.error)
            end
        end
    )
end










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
local function moveSend(event)
        local url = link.."battle/move.php?name="..name.."&pass="..pass.."&id="..bid.."&my="..myid.."&move="..move  -- замени на свой URL
        network.request(url, "GET", networkListenerM)
        return true
end















local lastMove = 0
local speed = 0.3

TankUpdate = function()
    local angleRad = math.rad(corp1.rotation)
    local dx = speed * math.cos(angleRad)
    local dy = speed * math.sin(angleRad)

    print("mv1 "..mv1)


    if mv1 == "2" then
        corp1.rotation = corp1.rotation + 0.3
    elseif mv1 == "-2" then
        corp1.rotation = corp1.rotation - 0.3
    elseif mv1 == "1" then
        corp1.x = corp1.x + dx
        corp1.y = corp1.y + dy
    elseif mv1 == "-1" then
        corp1.x = corp1.x - dx
        corp1.y = corp1.y - dy
    end

    local angleRad2 = math.rad(corp2.rotation)
    local dx2 = speed * math.cos(angleRad2)
    local dy2 = speed * math.sin(angleRad2)

    print("mv2 "..mv2)

    if mv2 == "2" then
        corp2.rotation = corp2.rotation + 1
    elseif mv2 == "-2" then
        corp2.rotation = corp2.rotation - 1
    elseif mv2 == "1" then
        corp2.x = corp2.x + dx2
        corp2.y = corp2.y + dy2
    elseif mv2 == "-1" then
        corp2.x = corp2.x - dx2
        corp2.y = corp2.y - dy2
    end


    bash1.x = corp1.x
    bash1.y = corp1.y
    nik1.x = corp1.x
    nik1.y = corp1.y-width*0.05
    hp1_txt.x = corp1.x
    hp1_txt.y = corp1.y-width*0.02

    bash2.x = corp2.x
    bash2.y = corp2.y
    nik2.x = corp2.x
    nik2.y = corp2.y-width*0.05
    hp2_txt.x = corp2.x
    hp2_txt.y = corp2.y-width*0.02

    if lastMove ~= move then
        lastMove = move
        moveSend()
    end

end















































end

-- Фаза отображения (перед показом или после)
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот появится на экране
    elseif phase == "did" then
        -- Сцена уже появилась
        timer.performWithDelay(100, fetchData, 0)
        timer.performWithDelay(100, fetchData2, 0)
        timer.performWithDelay(1, TankUpdate, 0)
        

    end
end

-- Фаза скрытия сцены
function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Сцена вот-вот исчезнет
    elseif phase == "did" then
        -- Сцена уже исчезла
    end
end

-- Уничтожение сцены (например, при выгрузке)
function scene:destroy(event)
    local sceneGroup = self.view
    -- Очистка ресурсов
end

-- Обязательно добавляем прослушку событий
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
