level1 = {
    init = function(self, g)
        local map = {
            { nil, nil, nil, nil, 1, 1, nil, nil, nil, nil },
            { nil, nil, nil, 1, 1, 1, 1, nil, nil, nil },
            { nil, nil, nil, 1, 1, 1, 1, nil, nil, nil }
        }

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

level2 = {
    init = function(self, g)
        local map = {
            { 1, nil, nil, nil, 1, 1, nil, nil, nil, 1 },
            { 1, nil, nil, 1, 1, 1, 1, nil, nil, 1 },
            { 1, nil, nil, 1, 1, 1, 1, nil, nil, 1 }
        }

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
                        local enemy = scene_enemy_green.make(
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