collutils = {
    make_shape_rect = function(ltpos, width, height)
        return ltpos:copy(), ltpos + vec2d.new(width, height)
    end,

    show_seq = function(seq, color)
        foreach(
            seq, function(s)
                collutils.show(s, color)
            end
        )
    end,

    show = function(entity, color)
        if entity != nil and entity.coll_shape != nil then
            local lt, rb = entity:coll_shape()
            rect(lt.x, lt.y, rb.x, rb.y, color)
        end
    end,

    detect = function(a, b)
        local a_lt, a_rb = a:coll_shape()
        local b_lt, b_rb = b:coll_shape()

        if a_lt.x > b_rb.x or b_lt.x > a_rb.x then
            return false
        end

        if a_lt.y > b_rb.y or b_lt.y > a_rb.y then
            return false
        end

        return true
    end,

    responsd_nx1 = function(seq, one, responsd)
        for s in all(seq) do
            if collutils.detect(s, one) then
                responsd(s, one)
            end
        end
    end,

    responsd_nxn = function(seq1, seq2, responsd)
        for s1 in all(seq1) do
            for s2 in all(seq2) do
                if collutils.detect(s1, s2) then
                    responsd(s1, s2)
                end
            end
        end
    end
}