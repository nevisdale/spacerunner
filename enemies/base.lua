scene_enemy_bullets = {}

scene_enemy_base = {
    new = function(pos, hp, anim)
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
}