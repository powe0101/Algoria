firstFont = false
secondFont = false

function SetGoyangFont()
    --고양시에서 무료로 배포하는 폰트. 추가적으로 저작권 표시해야할 수 있음.
    mainFont = love.graphics.newFont("font/Goyang.ttf", 15);
    love.graphics.setFont(mainFont)
end

function SetNanumFont()
    --네이버에서 무료로 배포하는 폰트. 추가적으로 저작권 표시해야할 수 있음.
    love.graphics.setFont(love.graphics.newFont("font/nanumBold.ttf", 12))
end