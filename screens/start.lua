scene_start = {
    init = function(g)
        g.title_sprs = split("32,33,34,35,36,37,38,39,39,36,37")
        g.press_any_key_colors = split("7,7,6,6,6,5,5,5")
        g.release_button = false
    end,

    before_update = function(g)
        -- music(1)
        g.release_button = false
    end,

    update = function(g)
        if not btn(4) and not btn(5) then
            g.release_button = true
        end

        if (btn(4) or btn(5)) and g.release_button then
            g.state = "levels"
        end
    end,

    draw = function(g)
        cls(0)

        g.bg:draw()
        for i, sprite in ipairs(g.title_sprs) do
            spr(sprite, 10 * i + 1, 30)
        end

        local p = time() % 1 * 15
        local press_any_color_index = 1 + flr(p % (#g.press_any_key_colors - 1))
        print("press ❎ or 🅾️ to start", 18, 70, g.press_any_key_colors[press_any_color_index])

        print("by kusindia with ♥", 26, 115, 6)
    end
}