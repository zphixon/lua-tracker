require("tracker")

t = Tracker.new({
    function (a)
        io.write(a .. " ")
        return a * 5
    end,
    function (b)
        io.write(b .. " ")
        return b * 5
    end,
    function (c)
        io.write(c .. " ")
        return c * 5
    end,
})

results = t:track({1, 2, 3})
print()

for k,v in ipairs(results) do
    print(k, v)
end

