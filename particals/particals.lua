scene_particals = {
    new_spark = function(pos)
        return {
            pos = pos,
            spd = vec2d.new(
                (rnd() - 0.5) * 4,
                (rnd() - 1) * 4
            ),
            age = 0,
            max_age = 5,

            is_active = true,

            draw = function(self)
                if self.age > self.max_age then
                    self.is_active = false
                    return
                end
                self.age += 1

                pset(self.pos.x, self.pos.y, 7)
                self.pos += self.spd
            end
        }
    end,


    draw = function(particals)
        foreach(
            particals, function(part)
                part:draw()
                if not part.is_active then
                    del(particals, part)
                end
            end
        )
    end
}

scene_particals.new_spark = function(pos)
    return {
        pos = pos,
        spd = vec2d.new(
            (rnd() - 0.5) * 4,
            (rnd() - 1) * 4
        ),
        age = 0,
        max_age = 5,

        is_active = true,

        draw = function(self)
            if self.age > self.max_age then
                self.is_active = false
                return
            end
            self.age += 1

            pset(self.pos.x, self.pos.y, 7)
            self.pos += self.spd
        end
    }
end

scene_particals.new_wave = function(pos)
    return {
        pos = pos,
        size = 2,
        max_size = 4,

        is_active = true,

        draw = function(self)
            if self.size > self.max_size then
                self.is_active = false
                return
            end

            circ(self.pos.x, self.pos.y, self.size, 9)
            self.size += 1
        end
    }
end

scene_particals.new_explosion = function(pos, typ)
    local explosions = {
        is_active = true,
        typ = typ or 1,

        get_color = function(self, age)
            if typ == 1 then
                if age > 15 then return 5 end
                if age > 12 then return 2 end
                if age > 10 then return 8 end
                if age > 7 then return 9 end
                if age > 5 then return 10 end
                return 7
            elseif typ == 2 then
                if age > 15 then return 6 end
                if age > 12 then return 12 end
                if age > 10 then return 13 end
                if age > 7 then return 1 end
                if age > 5 then return 1 end
                return 7
            else
                return 7
            end
        end,

        draw = function(self)
            if #self == 0 then
                self.is_active = false
                return
            end

            foreach(
                self, function(expl)
                    expl.pos += expl.spd
                    expl.spd *= 0.85
                    expl.age += 1
                    if expl.age > expl.max_age then
                        expl.size -= 0.5
                        if expl.size < 0 then
                            del(self, expl)
                            return
                        end
                    end
                    circfill(expl.pos.x, expl.pos.y, expl.size, self:get_color(expl.age, self.typ))
                end
            )
        end
    }

    for i = 1, 10 do
        local explosion = {
            pos = pos,
            spd = vec2d.new(
                (rnd() - 0.5) * 10,
                (rnd() - 0.5) * 10
            ),
            age = rnd(2),
            max_age = 10 + rnd(10),
            size = 1 + rnd(3)
        }
        if i == 1 then
            explosion.size = 10
            explosion.max_age = 0
        end

        add(explosions, explosion)
    end

    return explosions
end