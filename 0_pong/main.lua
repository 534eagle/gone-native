--[[ :GD50-pong ]]

-- dependencies {LIBS as submodules in git repo}
-- VIRTUAL-WINDOW
-- https://github.com/Ulydev/push.git

local push = require('push')


-- global variables
-- window screen size 720p aspect ratio 16:9 framerate 60 {720p60}
--[[
    The number 720 stands for the 720 horizontal scan lines of image display resolution
    (also known as 720 pixels of vertical resolution).
    The p stands for progressive scan, i.e. non-interlaced. When broadcast at 60.00 frames/s,
    720p features the highest temporal resolution possible under the ATSC and DVB standards.
    The term assumes a widescreen aspect ratio of 16:9, thus implying a resolution of 1280×720 px
    (0.9 megapixels).
]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
-- game width/height {virtual width/height [1/2]}
GAME_WIDTH = 640
GAME_HEIGHT = 360

BALL_SIZE = 4
-- BALL_POS = {x = 0,  y = 0}
BALL_POS = {x = GAME_WIDTH / 2 -2, y = GAME_HEIGHT / 2 -2} -- at center

-- global game states
-- 'start', 'serve', 'play', 'over'
GAME_STATE = 'start'


--[[ load ]]
function love.load()
    -- push library scales game to screen dimension. 
    push:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
    {fullscreen = false, vsync = true, resizable = true})
    
    -- texture filter { aliased blocky pixel art }
    --[[
        Nearest-neighbor interpolation is the simplest and crudest filtering method 
        — it simply uses the color of the texel closest to the pixel center for the pixel color.
        While simple, this results in a large number of artifacts - texture 'blockiness' during
        magnification,[3] and aliasing and shimmering during minification.
    ]]
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- window id
    love.window.setTitle('0_pong')
    -- load fonts
    SML_FONT = love.graphics.newFont('font.ttf', 16)
    MID_FONT = love.graphics.newFont('font.ttf', 32)
    LRG_FONT = love.graphics.newFont('font.ttf', 64)
end

--[[ resize callback ]]
function love.resize(w, h)
    push:resize(w,h)
end

--[[ keyboard callback]]
function love.keypressed(key)
    -- quit
    if key == 'escape' then
        love.event.quit()
    end
    -- game state change 'start' -> 'serve'
    if key == 'enter' or key =='return' and GAME_STATE == 'start' then
        GAME_STATE = 'serve'
    end
end


--[[ update ]]
function love.update()

end


--[[ draw ]]

function  love.draw()
    push:start()
    -- 1-bit game in 8-bit graphics-engine
    -- {0/255, 0/255, 0/255, 255/255} RGB-triplet:background/foreground &alpha ie RGBA
    --[[
        8-bit color graphics are a method of storing image information in a
        computer's memory or in an image file, so that each pixel is represented
        by one 8-bit byte. The maximum number of colors that can be displayed at
        any one time is 256 or 2pow8.
    ]]
    love.graphics.setBackgroundColor(0,0,0,255) -- black BG solid-alpha
    love.graphics.setColor(255,255,255,255) -- white solid-alpha
    -- draw white test rectangle at center
    --love.graphics.rectangle('fill', GAME_WIDTH / 2 -20, GAME_HEIGHT / 2 -20 , 40, 40)

    --[[ game state 'start']]
    if GAME_STATE == 'start' then
        love.graphics.setFont(SML_FONT)
        love.graphics.print('0_pong', GAME_WIDTH / 2 -20, 20)
        -- press enter to start
        love.graphics.setFont(MID_FONT)
        love.graphics.print('Press enter to start game.', GAME_WIDTH / 2 -230, GAME_HEIGHT / 2 -32)
    end

    --[[ game state 'serve']]
    if GAME_STATE == 'serve' then
        -- draw paddles and ball
        --[[ todo: draw paddles]]

        -- draw ball
        love.graphics.rectangle('fill', BALL_POS.x, BALL_POS.y, BALL_SIZE, BALL_SIZE)
    end

    push:finish()
end
