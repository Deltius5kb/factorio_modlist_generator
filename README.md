# Dependencies
## lua
windows: 
`winget install "Lua for Windows"`
(winget should be preinstalled on win11, you can get it on the microsoft store on win10)

## dkjson
https://github.com/LuaDist/dkjson

or

`luarocks install dkjson` (needs luarocks)

# Usage

`lua extract_enabled_mods <path to mod_list.json> <stuff to put between each mod, use \n to have each on a newline>`

your mod_list.json will be in your mods folder in factorio's appdata. 
