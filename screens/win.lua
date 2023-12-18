scene_win = {
    init = function(g)
        g.you_win_sprs = split("40,41,42")
        g.win_delay = 30
    end,

    before_update = function(g)
        g.release_button = false
        g.win_delay = 30
    end,

    update = function(g)
        if g.win_delay > 0 then
            g.win_delay -= 1
            return
        end

        if not btn(4) and not btn(5) then
            g.release_button = true
        end

        if (btn(4) or btn(5)) and g.release_button then
            scene_game.reset(g)
            scene_levels.reset(g)
            g.state = "levels"
        end
    end,

    draw = function(g)
        cls(0)

        print("win screen")

        g.bg:draw()

        for i, sprite in ipairs(g.you_win_sprs) do
            spr(sprite, 10 * i + 1, 30)
        end

        local p = time() % 1 * 15
        local press_any_color_index = 1 + flr(p % (#g.press_any_key_colors - 1))
        local press_any_color = g.press_any_key_colors[press_any_color_index]
        print("press ❎ or 🅾️ to play again", 18, 70, press_any_color)
    end
}