scene_levels = {
    get_level = function(num)
        if num == 1 then
            return level1.new()
        elseif num == 2 then
            return level2.new()
        end
    end,

    reset = function(g)
        g.level_delay = 60
        g.level_num = conf.start_level or 1
        g.level = nil
        g.level_to_init = nil
    end,

    init = function(g)
        g.levels_colors = split("7,7,6,6,6,5,5,5")
        scene_levels.reset(g)
    end,

    before_update = function(g)
        g.bg:move_faster()
        g.level_to_init = scene_levels.get_level(g.level_num)
        g.level = nil
        g.level_num += 1
        g.level_delay = 60
    end,

    update = function(g)
        scene_game.update(g)

        if g.level_delay > 0 then
            g.level_delay -= 1
            return
        end

        if g.level_to_init == nil then
            g.bg:move_slower()
            g.state = "win"
            return
        end

        g.level_to_init:init(g)
        g.level = g.level_to_init

        g.bg:move_slower()
        g.state = "game"
    end,

    draw = function(g)
        scene_game.draw(g)

        if g.level_delay < 50 and g.level_to_init != nil then
            for i, sprite in ipairs(split("49,36,41,36,49")) do
                spr(sprite, 10 * i + 33, 50)
            end
        end
    end
}