scene_player = {
    new = function(pos, spd, hp)
        return {
            pos = pos,
            spd = spd,

            hp = hp,
            max_hp = hp,
            invuln_delay = 0,

            shoot_delay = 0,
            muzzle_size = 0,

            spr = 2,

            -- flame
            flame_parts = {},


            coll_shape = function(self)
                return collutils.make_shape_rect(self.pos, 7, 7)
            end,

            take_damage = function(self, n)
                if self.invuln_delay > 0 then
                    return false
                end
                self.hp = max(self.hp - 1, 0)
                self.invuln_delay = 75
                return true
            end,

            is_dead = function(self)
                return self.hp <= 0
            end,

            shoot = function(self, callBack)
                if self.shoot_delay > 0 then
                    return false
                end
                self.shoot_delay = 5
                self.muzzle_size = 4
                callBack(self)
                return
            end,

            move = function(self, direction)
                direction = direction * self.spd
                self.pos += direction
                if direction.x > 0 then
                    self.spr = 3
                elseif direction.x < 0 then
                    self.spr = 1
                end
            end,

            update = function(self)
                self.shoot_delay = max(self.shoot_delay - 1, 0)
                self.invuln_delay = max(self.invuln_delay - 1, 0)
                self.pos.x = mid(0, self.pos.x, 120)
                self.pos.y = mid(0, self.pos.y, 113)

                add(
                    self.flame_parts, {
                        pos = self.pos + vec2d.new(4 + 0.5 - rnd(), 9),
                        spd = vec2d.new(2 * (rnd() - 0.5), 1),
                        ttl = 7,
                        size = 1
                    }
                )
            end,

            draw = function(self)
                if self:is_dead() then
                    return
                end

                if self.invuln_delay <= 0 or sin(time() / 0.5) < 0.2 then
                    spr(self.spr, self.pos.x, self.pos.y)
                end
                self.spr = 2

                if self.muzzle_size > 0 then
                    circfill(self.pos.x + 3, self.pos.y, self.muzzle_size, 7)
                    circfill(self.pos.x + 4, self.pos.y, self.muzzle_size, 7)
                    self.muzzle_size -= 1
                end

                local get_flame_color = function(ttl)
                    local flame_color = 7
                    if ttl <= 5 then flame_color = 9 end
                    if ttl <= 2 then flame_color = 8 end
                    if ttl <= 1 then flame_color = 5 end
                    return flame_color
                end

                foreach(
                    self.flame_parts, function(part)
                        part.ttl -= 1
                        part.size *= 1.1
                        if part.ttl <= 0 then
                            del(self.flame_parts, part)
                            return
                        end
                        circfill(part.pos.x, part.pos.y, part.size, get_flame_color(part.ttl))
                        part.pos += part.spd
                    end
                )
            end
        }
    end
}