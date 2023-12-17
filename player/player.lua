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
            flame_anim = anim.make("5,6,7,8,9"),


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
            end,

            draw = function(self)
                if self:is_dead() then
                    return
                end

                if self.invuln_delay <= 0 or sin(time() / 0.5) < 0.2 then
                    spr(self.spr, self.pos.x, self.pos.y)
                    spr(anim.next(self.flame_anim), self.pos.x, self.pos.y + 8)
                end
                self.spr = 2

                if self.muzzle_size > 0 then
                    circfill(self.pos.x + 3, self.pos.y, self.muzzle_size, 7)
                    circfill(self.pos.x + 4, self.pos.y, self.muzzle_size, 7)
                    self.muzzle_size -= 1
                end
            end
        }
    end
}