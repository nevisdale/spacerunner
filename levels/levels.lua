level_template = {
    new_from_map = function(map)
        return {
            init = function(self, g)
                for y, row in pairs(map) do
                    if row != nil then
                        for i, enemyType in pairs(row) do
                            if enemyType != nil then
                                local shift = 30
                                local posx = i * 12 - 6
                                if posx < 64 then
                                    shift = -shift
                                end
                                posx += shift
                                local enemy = scene_enemy_red.make(
                                    vec2d.new(posx, -64),
                                    vec2d.new(i * 12 - 6, 2 + y * 12)
                                )
                                add(g.enemies, enemy)
                            end
                        end
                    end
                end
            end,

            update = function(self, g)
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
            { nil, nil, nil, nil, 1, 1, nil, nil, nil, nil },
            { nil, nil, nil, 1, 1, 1, 1, nil, nil, nil },
            { nil, nil, nil, 1, 1, 1, 1, nil, nil, nil }
        }
        return level_template.new_from_map(map)
    end
}

level2 = {
    new = function()
        local map = {
            { 1, nil, nil, nil, 1, 1, nil, nil, nil, 1 },
            { 1, nil, nil, 1, 1, 1, 1, nil, nil, 1 },
            { 1, nil, nil, 1, 1, 1, 1, nil, nil, 1 }
        }
        return level_template.new_from_map(map)
    end
}