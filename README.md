
# lua-tracker

`Tracker.new()` takes a table of functions.

`Tracker:track()` takes a table of values, and calls function with each corresponding value.

## Example

```lua
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
```

prints the following:

```
1 2 3
1       5
2       10
3       15
```

