scene_starfield = {
    new = function(n)
        local starfield = {}
        for i = 1, n or 100 do
            add(
                starfield, {
                    pos = vec2d.new(flr(rnd(128)), flr(rnd(128))),
                    spd = vec2d.new(0, 0.5 + rnd(1.5)),
                    spdx = 2
                }
            )
        end

        starfield.draw = function(self)
            foreach(
                self, function(star)
                    star.pos += star.spd * star.spdx
                    if star.pos.y > 128 then
                        star.pos.y = 0
                    end
                    pset(
                        star.pos.x,
                        star.pos.y,
                        scene_starfield.get_color(star)
                    )
                end
            )
        end

        starfield.move_faster = function(self)
            self:change_spdx(2)
        end

        starfield.move_slower = function(self)
            self:change_spdx(-2)
        end

        starfield.change_spdx = function(self, spdx)
            foreach(self, function(star) star.spdx += spdx end)
        end

        return starfield
    end,

    get_color = function(star)
        local mag = star.spd:mag()
        if mag < 1 then
            return 1
        end
        if mag < 1.5 then
            return 5
        end
        if mag < 2 then
            return 13
        end

        return 6
    end
}