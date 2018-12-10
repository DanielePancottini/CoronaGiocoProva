
-- classe Balls per l' activity Play

Balls = {}
Balls.__index = Balls


function Balls.new(xPosition, yPosition, radius)
    local self = setmetatable({}, Balls)

    --attributi palla
    local ball = display.newCircle(0, 0, radius)

    local red = math.random()
    local green = math.random()
    local blue = math.random()

    ball.fill = {red, green, blue}
    ball.strokeWidth = 2
    ball.stroke = {3*red/4, 3*green/4, 3*blue/4}

    --testo dentro i bottoni
    intForText = math.random(100)
    local text = display.newText(intForText, 0, 0, native.systemFont, 5*radius/8)

    --group button + text
    local group = display.newGroup()
    group:insert(ball)
    group:insert(text)
    group.x = xPosition
    group.y = yPosition

    --listener per il tocco
    
    --fine listener per il tocco

        self.group = group
        self.ball = ball
        self.text = intForText

    return self

end

function Balls:getBall()
    --metodo che restituisce l' oggetto
    return self.group
end

function Balls:getText()
    return intForText
end