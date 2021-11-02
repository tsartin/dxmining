if not matches[2] then
	dx.mining:showConfigs()
	return
end

local val = matches[4]
if val == "true" or val == "yes" or val == "on" then val = true end
if val == "false" or val == "no" or val == "off" then val = false end
local numberVal = tonumber(val)
val = numberVal and numberVal or val
dx.mining:toggle(matches[3], val)