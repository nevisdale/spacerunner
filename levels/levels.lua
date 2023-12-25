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
                        local enemy = scene_enemy_green.new(
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
                if time() % 3 != 0 then
                    return
                end

                local to_attac = {}
                foreach(
                    g.enemies, function(enemy)
                        if enemy.mission != "protec" then
                            return
                        end
                        local need_to_add = false
                        foreach(
                            to_attac, function(valid_enemy)
                                if need_to_add then
                                    return
                                end
                                if valid_enemy.pos.x == enemy.pos.x then
                                    if valid_enemy.pos.y < enemy.pos.y then
                                        need_to_add = true
                                        del(to_attac, valid_enemy)
                                    end
                                else
                                    need_to_add = true
                                end
                            end
                        )
                        if need_to_add or #to_attac == 0 then
                            add(to_attac, enemy)
                        end
                    end
                )

                local enemy_to_attac = rnd(to_attac)
                if enemy_to_attac == nil then
                    return
                end

                enemy_to_attac.mission = "attac"
            end,

            is_done = function(self, g)
                return #g.enemies == 0
            end
        }
    end
}

level1 = {
    new = function()
        local map = {
            { 0, 1, 0, 0, 1, 1, 0, 0, 1, 0 },
            { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
            { 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 }
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