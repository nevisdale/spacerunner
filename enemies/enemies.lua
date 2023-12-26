scene_enemy_bullets = {} -- store all enemy bullets

scene_enemy = {}

scene_enemy.new_template = function(pos, hp, anim)
    return {
        pos = pos,
        target = pos,
        hp = hp,
        mission = "flyin",
        flash_delay = 0,
        wait = wait or 0,
        anim = anim,
        w = 1,
        h = 1,
        shake = 0,

        protec_update = function(enemy)
        end,

        attac_update = function(enemy)
        end,


        coll_shape = function(self)
            return collutils.make_shape_rect(self.pos, 7, 7)
        end,


        take_damage = function(self, n)
            self.hp = max(self.hp - n, 0)
            if self.flash_delay == 0 then
                self.flash_delay = 2
            end
        end,

        is_dead = function(self)
            return self.hp <= 0 or self.pos.y > 128
        end,

        update = function(self)
            if self.mission == "flyin" then
                if self.wait > 0 then
                    self.wait -= 1
                    return
                end
                if self.pos == self.target then
                    self.mission = "protec"
                end

                self.pos += (self.target - self.pos) / 8
                local diff = self.target - self.pos
                if diff:mag() < 0.3 then
                    self.pos = self.target
                end
            elseif self.mission == "protec" then
                self.protec_update(self)
            elseif self.mission == "attac" then
                self.attac_update(self)
            end
        end,

        draw = function(self)
            if self.flash_delay > 0 then
                self.flash_delay -= 1
                for i = 1, 15 do
                    pal(i, 7)
                end
            end

            local posx = self.pos.x
            local posy = self.pos.y

            if self.shake > 0 then
                posx += sin(time() % 5 * 5)
                self.shake -= 1
            end

            spr(self.anim:next(), posx, posy, self.w, self.h)
            pal()
        end
    }
end

scene_enemy.new_green = function(pos, target)
    local enemy = scene_enemy.new_template(pos, 3, anim.make("21,22,23,24", 0.5))
    enemy.wait = 30
    enemy.target = target
    enemy.player_pos = nil

    -- move up and down
    local waiting_spd = vec2d.new(0, 0.1)
    local waiting_frames = 30
    enemy.protec_update = function()
        enemy.anim.spd = 0.5

        waiting_frames -= 1
        if waiting_frames == 0 then
            waiting_spd = waiting_spd * -1.0
            waiting_frames = 30
        end
        enemy.pos += waiting_spd
    end

    local once = false
    local shake = 25
    enemy.attac_update = function(enemy)
        waiting_frames -= 1
        if waiting_frames == 0 then
            waiting_spd = waiting_spd * -1.0
            waiting_frames = 30
        end
        enemy.pos += waiting_spd

        enemy.anim.spd = 1

        if not once then
            enemy.shake = shake
            once = true
        end
        if enemy.shake > 0 then
            enemy.shake -= 1
            return
        end

        once = false

        local bullet_pos = enemy.pos + vec2d.new(2, 2)
        local bullet_spd = enemy.player_pos - bullet_pos
        bullet_spd:normalize()
        bullet_spd *= 2
        local bullet = scene_enemy_bullet.new(bullet_pos, bullet_spd)
        add(scene_enemy_bullets, bullet)

        enemy.mission = "protec"
    end
    return enemy
end

scene_enemy.new_red = function(pos, target)
    local enemy = scene_enemy.new_template(pos, 3, anim.make("140,141,142,143", 0.3))
    enemy.target = target
    enemy.wait = 30
    enemy.attac_update = function(enemy)
        enemy.pos += vec2d.new(sin(time() % 3 * 3), 1.7)
    end
    return enemy
end