anim = {
    make = function(sprs, spd)
        return {
            sprs = split(sprs),
            curr = 1,
            spd = spd or 1
        }
    end,

    next = function(anim)
        if flr(anim.curr) > #anim.sprs then
            anim.curr = 1
        end

        local s = anim.sprs[flr(anim.curr)]
        anim.curr += anim.spd
        return s
    end
}