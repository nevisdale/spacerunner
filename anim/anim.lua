anim = {
    make = function(sprs, spd)
        return {
            sprs = split(sprs),
            curr = 1,
            spd = spd or 1,

            next = function(self)
                if flr(self.curr) > #self.sprs then
                    self.curr = 1
                end

                local s = self.sprs[flr(self.curr)]
                self.curr += self.spd
                return s
            end
        }
    end
}