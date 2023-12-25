once = {
    fn = function() end,
    done = false
}

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

        local once = false
        local shake = 25

        local wait_ater_shoot = 25
        enemy.attac_update = function(enemy)
            enemy.anim.spd = 1

            if not once then
                enemy.shake = shake
                once = true
            end
            if shake > 0 then
                shake -= 1
                return
            end

            local bullet = scene_enemy_bullet.new(enemy.pos + vec2d.new(2, 2), vec2d.new(0, 1))
            add(scene_enemy_bullets, bullet)

            enemy.mission = "protec"

            enemy.pos += vec2d.new(sin(time() % 3 * 3), 1.7)
            enemy.anim.spd = 1
        end
        return enemy
    end
}