scene_enemy_red = {
    make = function(pos, target)
        local enemy = scene_enemy_base.new(pos, 3, anim.make("140,141,142,143", 0.3))
        enemy.target = target
        enemy.wait = 30
        enemy.attac_update = function(enemy)
            enemy.pos += vec2d.new(sin(time() % 3 * 3), 1.7)
        end
        return enemy
    end
}