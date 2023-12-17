vec2d = { x = 0, y = 0 }

function vec2d.new(x, y)
    local vec = {
        x = x,
        y = y,

        copy = function(self)
            return vec2d.new(self.x, self.y)
        end,

        mag = function(self)
            return sqrt(self.x * self.x + self.y * self.y)
        end,

        normalize = function(self)
            local mag = self:mag()
            if mag != 0 then
                self.x /= mag
                self.y /= mag
            end
        end
    }

    return setmetatable(vec, vec2d)
end

function vec2d.__add(a, b)
    return vec2d.new(a.x + b.x, a.y + b.y)
end

function vec2d.__sub(a, b)
    return vec2d.new(a.x - b.x, a.y - b.y)
end

function vec2d.__mul(a, b)
    if type(a) == "number" then
        return vec2d.new(b.x * a, b.y * a)
    elseif type(b) == "number" then
        return vec2d.new(a.x * b, a.y * b)
    end
    return a.x * b.x + a.y * b.y
end

function vec2d.__div(a, b)
    return vec2d.new(a.x / b, a.y / b)
end

function vec2d.__tostring(a)
    return "(" .. a.x .. "," .. a.y .. ")"
end

function vec2d.__eq(a, b)
    return a.x == b.x, a.y == b.y
end