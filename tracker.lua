
Tracker = {}
Tracker.__index = Tracker
setmetatable(Tracker, {
    __call = function(cls, ...)
        return cls.new(...)
    end,
})

function Tracker.new(columns)
    local self = setmetatable({}, Tracker)
    if "table" ~= type(columns) then
        error("type of columns must be table")
    elseif 0 == #columns then
        error("tracker must have at least one column")
    else
        for k,v in ipairs(columns) do
            if "function" ~= type(v) then
                error("tracker must be table of functions: " .. v .. " is not a function")
            end
        end
    end
    self.columns = columns
    return self
end

function Tracker:track(values)
    if #values ~= #self.columns then
        error("must track with the same number of columns: found " .. #values .. ", expected " .. #self.columns)
    end
    results = {}
    for k, v in ipairs(self.columns) do
        result = v(values[k])
        table.insert(results, result)
    end
    return results
end

