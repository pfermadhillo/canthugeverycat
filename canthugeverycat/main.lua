-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local gw = 720
local gh = 1280 
local bdr = 50
local halfw = gw/2
local halfh = gh/2
local thirdh = gh/3
local thirdw = gw/3

local bg = display.newImageRect("img/cathouse2.png", 720, 1280) 
bg.x = bg.width/2
bg.y = bg.height/2
-- background.anchorX = 0 
-- background's left edge is located at x = 200. background.anchorX = 0.5 
-- background is horizontally centered at x = 200. background.anchorX = 1 
-- background's right edge is located at x = 200.
bg.id = "bg object"
bg.name = "bg"





local btn_house = display.newImageRect("img/button_house.png", 106, 78) 
btn_house.x = 400
btn_house.y = 200


local house_rect = display.newRoundedRect( halfw, 1.5*thirdh, gw-bdr, 2*thirdh-bdr, 12 )
house_rect.strokeWidth = 3
house_rect:setFillColor( 0.5 )
house_rect:setStrokeColor( 1, 0, 0 )
-- house_rect.isVisible = false
-- local object = display.newImage( "ball.png" )
btn_house.id = "btn_house object"
btn_house.name = "btn_house"

local options = 
{
    parent = house_rect,
    text = "Hello World",     
    x = 3*bdr,
    y = 0.7*thirdh,
    -- width = 128,
    font = native.systemFont,   
    fontSize = 40,
    align = "right"  -- Alignment parameter
}
local myText = display.newText( options )
myText:setFillColor( 1, 1, 1 )

local houseRectGroup = display.newGroup()
houseRectGroup:insert( house_rect )
houseRectGroup:insert( myText )
houseRectGroup.isVisible = false


-- Tap listener function
local function tapListenerBtnHouse( event )
    local object = event.target
    print( object.name .. " TAP" )
    houseRectGroup.isVisible = true
    return true  -- Prevent propagation to underlying tap objects
end
-- Tap listener function
local function tapListenerBG( event )
    local object = event.target
    print( object.name .. " TAP" )
    houseRectGroup.isVisible = false
    return true  -- Prevent propagation to underlying tap objects
end

btn_house:addEventListener( "tap", tapListenerBtnHouse )
bg:addEventListener( "tap", tapListenerBG )
houseRectGroup:addEventListener( "tap", function() return true; end )


-- local function onBtnHouseTouch( event )
--     if ( event.phase == "began" ) then
--         print( "Touch event began on: " .. event.target.id )
--     elseif ( event.phase == "ended" ) then
--         print( "Touch event ended on: " .. event.target.id )
-- 		house_rect.isVisible = true
--     end
--     return true
-- end
-- btn_house:addEventListener( "touch", onBtnHouseTouch )



-- local function onBGTouch( event )
--     if ( event.phase == "began" ) then
--         print( "Touch event began on: " .. event.target.id )
--     elseif ( event.phase == "ended" ) then
--         print( "Touch event ended on: " .. event.target.id )
-- 		house_rect.isVisible = false
--     end
--     return true
-- end
-- bg:addEventListener( "touch", onBGTouch )