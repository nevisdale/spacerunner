scene_enemy_red = {
    make = function(pos, target)
        local enemy = scene_enemy_base.new(pos, 3, anim.make("140,141,142,143", 0.3))
        enemy.target = target
        enemy.wait = 30
        enemy.protec_update = function(enemy)
            enemy.pos += vec2d.new(sin(time() % 5), 0.5)
        end
        return enemy
    end
}