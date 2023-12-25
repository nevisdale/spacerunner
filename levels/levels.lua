level_template = {
    new_from_map = function(map)
        return {
            init = function(self, g)
                for y, row in pairs(map) do
                    if row == nil then
                        goto continue1
                    end

                    for i, enemy_type in pairs(row) do
                        if enemy_type == nil or enemy_type == 0 then
                            goto continue2
                        end

                        local shift = 30
                        local posx = i * 12 - 6
                        if posx < 64 then
                            shift = -shift
                        end
                        posx += shift
                        local enemy = scene_enemy.new_green(
                            vec2d.new(posx, -64),
                            vec2d.new(i * 12 - 6, 2 + y * 12)
                        )
                        add(g.enemies, enemy)

                        ::continue2::
                    end

                    ::continue1::
                end
            end,

            update = function(self, g)
                for enemy in all(g.enemies) do
                    enemy.player_pos = g.player.pos
                end

                if time() % 0.5 != 0 then
                    return
                end

                local to_attac = {}
                for enemy in all(g.enemies) do
                    if enemy.mission != "protec" then
                        goto continue
                    end

                    local need_to_add = true
                    for candidate in all(to_attac) do
                        if abs(candidate.pos.x - enemy.pos.x) < 4 then
                            if candidate.pos.y < enemy.pos.y then
                                del(to_attac, candidate)
                            else
                                need_to_add = false
                            end
                        end
                    end
                    if need_to_add then
                        add(to_attac, enemy)
                    end

                    ::continue::
                end

                local enemy_to_attac = rnd(to_attac)
                if enemy_to_attac == nil then
                    return
                end

                enemy_to_attac.mission = "attac"
            end,

            is_done = function(self, g)
                return #g.enemies == 0 and #g.enemy_bullets == 0
            end
        }
    end
}

level1 = {
    new = function()
        local map = {
            { 0, 1, 0, 0, 1, 1, 0, 0, 1, 0 },
            { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 },
            { 0, 0, 0, 1, 1, 1, 1, 0, 0, 0 }
        }
        return level_template.new_from_map(map)
    end
}

level2 = {
    new = function()
        local map = {
            { 1, 0, 0, 0, 1, 1, 0, 0, 0, 1 },
            { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
            { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 }
        }
        return level_template.new_from_map(map)
    end
}

level3 = {
    new = function()
        local map = {
            { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
            { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
            { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
            { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
        }
        return level_template.new_from_map(map)
    end
}