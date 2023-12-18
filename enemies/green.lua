scene_enemy_green = {
    new = function(pos, target)
        local enemy = scene_enemy_base.new(pos, 3, anim.make("21,22,23,24", 0.5))
        enemy.target = target
        enemy.wait = 30

        local spd = vec2d.new(0, 0.1)
        local u = 30
        enemy.protec_update = function()
            u -= 1
            if u == 0 then
                spd = vec2d.new(0, 0) - spd
                u = 30
            end
            enemy.pos += spd
        end

        local shake = 25
        enemy.attac_update = function(enemy)
            enemy.anim.spd = 1

            if shake > 0 then
                enemy.pos += vec2d.new(sin(time() % 5 * 5), 0)
                shake -= 1
                return
            end

            enemy.pos += vec2d.new(sin(time() % 3 * 3), 1.7)
            enemy.anim.spd = 1
        end
        return enemy
    end
}