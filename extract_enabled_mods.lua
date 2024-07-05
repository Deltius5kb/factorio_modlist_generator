-- Load the dkjson library
local json = require("dkjson")

-- Function to read the content of a file
local function readFile(filename)
	local file = io.open(filename, "r") -- Open the file in read mode
	if not file then
		error("Could not open file: " .. filename)
	end
	local content = file:read("*all") -- Read the entire file content
	file:close() -- Close the file
	return content
end

-- Check if a file name is provided as a command line argument
if #arg < 2 then
	print("Usage: lua extract_enabled_mods.lua <json_file> <mod name seperator (\n for newline)>")
	os.exit(1)
end

-- Path to the JSON file
local jsonFile = arg[1]

-- Read the JSON file content
local jsonString = readFile(jsonFile)

-- Decode the JSON string into a Lua table
local data, pos, err = json.decode(jsonString, 1, nil)
if err then
	error("Error parsing JSON: " .. err)
end

-- Extract the names of enabled mods
local enabledMods = {}
for _, mod in ipairs(data.mods) do
	if mod.enabled then
		table.insert(enabledMods, mod.name)
	end
end

-- Concatenate the names of the enabled mods into a single string
local delimiter = arg[2]
if delimiter == "\\n" then
	delimiter = "\n"
end
local enabledModsString = table.concat(enabledMods, delimiter)

-- Print the result
print("Enabled mods: " .. enabledModsString)
