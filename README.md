# 🛰️ nvim-gps

Take this handy dandy gps with you on your coding adventures and always know where you are!

## 🤔 What is nvim-gps?

nvim-gps is a simple status line component that shows context of the current cursor position in file. It is similar to the statusline function provided by [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/blob/af96150a2d34a05b7265ee3c42425315bcd62e39/doc/nvim-treesitter.txt#L414), but smarter. Using custom treesitter queries for each language, nvim-gps is able to show exact name of containing class, struct, function, method, etc. along with some fancy symbols!

![example](https://user-images.githubusercontent.com/43147494/130349444-fa7176a3-d068-4309-87ec-bcf6f0204261.png)

![nvim-gps-demo](https://user-images.githubusercontent.com/43147494/130349453-d3e1fd61-348e-439c-b013-3433fd284323.gif)

## ⚡️ Requirements

* Neovim >= 0.5.0
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## 📦 Installation

Install the plugin with your preferred package manager:

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
-- Lua
use {
	"SmiteshP/nvim-gps",
	requires = "nvim-treesitter/nvim-treesitter"
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
" Vimscript
Plug "nvim-treesitter/nvim-treesitter"
Plug "SmiteshP/nvim-gps"
```

## ⚙️ Configuration

nvim-gps provides a setup function that takes in a table with configuration options.

```lua
-- Lua

-- Example config
require("nvim-gps").setup({
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' '      -- Methods (functions inside class-like objects)
	},
	languages = {                    -- You can disable any language individually here
		["c"] = true,
		["cpp"] = true,
		["go"] = true,
		["java"] = true,
		["javascript"] = true,
		["lua"] = true,
		["python"] = true,
		["rust"] = true,
	},
	separator = ' > ',
})
```

## 🚀 Usage

nvim-gps doesn't modify your statusline by itself, instead you are provided with two functions and it is left up to you to incorporate them into your statusline.

```lua
-- Lua
local gps = require("nvim-gps")

gps.is_available()  -- Returns boolean value indicating whether a output can be provided
gps.get_location()  -- Returns a string with context information
```

Few examples below

### [feline](https://github.com/famiu/feline.nvim)
```lua
-- Lua
table.insert(components.left.active, {
	provider = function()
		return require("nvim-gps").get_location()
	end,
	enabled = function()
		return require("nvim-gps").is_available()
	end
})
```

### [galaxyline](https://github.com/glepnir/galaxyline.nvim)

```lua
-- Lua
local gps = require("nvim-gps")

require('galaxyline').section.left[1]= {
	nvimGPS = {
		provider = function()
			return gps.get_location()
		end,
		condition = function()
			return gps.is_available()
		end
	}
}
```

### [lualine](https://github.com/hoob3rt/lualine.nvim)
```lua
-- Lua
local gps = require("nvim-gps")

local function gps_location()
	if gps.is_available() then
		return gps.get_location()
	else
		return ""
	end
end

require("lualine").setup({
	sections = {
		lualine_c = {gps_location}
	}
})
```
