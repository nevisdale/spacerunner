scene_over = {
    init = function(g)
        g.over_sprs = split("44,45,46,42,47,40,41,42,43")
    end,

    before_update = function(g)
        g.release_button = false
    end,

    update = function(g)
        if not btn(4) and not btn(5) then
            g.release_button = true
        end

        if (btn(4) or btn(5)) and g.release_button then
            scene_game.reset(g)
            g.state = "levels"
        end
    end,

    draw = function(g)
        cls(0)

        g.bg:draw()

        for i, sprite in ipairs(g.over_sprs) do
            spr(sprite, 10 + 10 * i + 1, 30)
        end

        local p = time() % 1 * 15
        local press_any_color_index = 1 + flr(p % (#g.press_any_key_colors - 1))
        print("press ❎ or 🅾️ to play again", 12, 70, g.press_any_key_colors[press_any_color_index])
    end
}