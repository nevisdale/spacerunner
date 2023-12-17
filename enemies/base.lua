scene_enemy_base = {
    make = function(pos, target, hp, anim, wait)
        return {
            pos = pos,
            target = target,
            spd = vec2d.new(0, 0),
            hp = hp,
            mission = "flyin",
            flash_delay = 0,
            wait = wait or 0,
            anim = anim,
            w = 1,
            h = 1,


            -- default
            coll_shape = function(self)
                return collutils.make_shape_rect(self.pos, 7, 7)
            end,

            update = function(self)
                scene_enemy_base.update(self)
            end
        }
    end,

    take_damage = function(enemy, n)
        enemy.hp = max(enemy.hp - n, 0)
        if enemy.flash_delay == 0 then
            enemy.flash_delay = 2
        end
    end,

    is_died = function(enemy)
        return enemy.hp <= 0 or enemy.pos.y > 128
    end,

    set_speed = function(enemy, spd)
        enemy.spd = spd
    end,


    update = function(enemy)
        if enemy.mission == "flyin" then
            if enemy.wait > 0 then
                enemy.wait -= 1
                return
            end
            if enemy.pos == enemy.target then
                enemy.mission = "protec"
            end

            enemy.pos += (enemy.target - enemy.pos) / 8
            local diff = enemy.target - enemy.pos
            if diff:mag() < 0.3 then
                enemy.pos = enemy.target
            end
        elseif enemy.mission == "protec" then
            enemy.pos.y += 0.5
        elseif enemy.mission == "attac" then
        end
    end,

    draw = function(enemy)
        if enemy.flash_delay > 0 then
            enemy.flash_delay -= 1
            for i = 1, 15 do
                pal(i, 7)
            end
        end
        spr(anim.next(enemy.anim), enemy.pos.x, enemy.pos.y, enemy.w, enemy.h)
        pal()
    end
}