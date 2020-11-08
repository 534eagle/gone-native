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


--[[ load ]]
function love.load()
    push:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
    {fullscreen = false, vsync = true, resizable = true})
end

--[[ resize callback ]]
function love.resize(w, h)
    push:resize(w,h)
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
    love.graphics.rectangle('fill', GAME_WIDTH / 2 -20, GAME_HEIGHT / 2 -20 , 40, 40)

    push:finish()
end
