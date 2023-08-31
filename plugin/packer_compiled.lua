-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aloysobek/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/aloysobek/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/aloysobek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/aloysobek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aloysobek/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\4À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\4À\3À\tjump\rjumpable\21select_prev_item\fvisible“\5\1\0\15\0(\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0025\2\4\0006\3\5\0\18\5\2\0B\3\2\4X\6\5€8\b\a\0019\b\6\b5\n\a\0=\0\b\nB\b\2\1E\6\3\3R\6ù\1276\3\0\0'\5\t\0B\3\2\0026\4\0\0'\6\n\0B\4\2\0029\5\6\0045\a\14\0005\b\f\0003\t\v\0=\t\r\b=\b\15\a9\b\16\0049\b\17\b9\b\18\b5\n\20\0009\v\16\0049\v\19\v)\rüÿB\v\2\2=\v\21\n9\v\16\0049\v\19\v)\r\4\0B\v\2\2=\v\22\n9\v\16\0049\v\23\vB\v\1\2=\v\24\n9\v\16\0049\v\25\v5\r\28\0009\14\26\0049\14\27\14=\14\29\rB\v\2\2=\v\30\n9\v\16\0043\r\31\0005\14 \0B\v\3\2=\v!\n9\v\16\0043\r\"\0005\14#\0B\v\3\2=\v$\nB\b\2\2=\b\16\a4\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\b=\b'\aB\5\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-d>\n<C-u>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\bcmp\fluasnip\17capabilities\1\0\0\nsetup\vipairs\1\4\0\0\vclangd\ncmake\npylsp\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¶\1\0\0\4\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\2\18\1\0\0B\1\1\1K\0\1\0\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\tdark\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\n¡\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\17file_browser\1\0\0\1\0\1\17hijack_netrw\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n \2\0\0\b\0\20\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\18\0005\4\16\0005\5\b\0005\6\5\0009\a\4\0=\a\6\0069\a\4\0=\a\a\6=\6\t\0055\6\n\0009\a\4\0=\a\6\0069\a\4\0=\a\a\0069\a\v\0=\a\f\0069\a\r\0=\a\14\6=\6\15\5=\5\17\4=\4\19\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\15<leader>oh\22select_horizontal\15<leader>ov\20select_vertical\1\0\0\6i\1\0\0\14<leader>e\14<leader>f\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nq\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14direction\nfloat\17open_mapping\14<leader>t\14autochdir\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n \2\0\0\b\0\20\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\18\0005\4\16\0005\5\b\0005\6\5\0009\a\4\0=\a\6\0069\a\4\0=\a\a\6=\6\t\0055\6\n\0009\a\4\0=\a\6\0069\a\4\0=\a\a\0069\a\v\0=\a\f\0069\a\r\0=\a\14\6=\6\15\5=\5\17\4=\4\19\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\15<leader>oh\22select_horizontal\15<leader>ov\20select_vertical\1\0\0\6i\1\0\0\14<leader>e\14<leader>f\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: telescope-file-browser.nvim
time([[Config for telescope-file-browser.nvim]], true)
try_loadstring("\27LJ\2\n¡\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\17file_browser\1\0\0\1\0\1\17hijack_netrw\2\nsetup\14telescope\frequire\0", "config", "telescope-file-browser.nvim")
time([[Config for telescope-file-browser.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\tdark\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¶\1\0\0\4\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0B\0\2\2\18\1\0\0B\1\1\1K\0\1\0\1\0\1\14with_sync\2\vupdate\28nvim-treesitter.install\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14direction\nfloat\17open_mapping\14<leader>t\14autochdir\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\4À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\4À\3À\tjump\rjumpable\21select_prev_item\fvisible“\5\1\0\15\0(\0O6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0025\2\4\0006\3\5\0\18\5\2\0B\3\2\4X\6\5€8\b\a\0019\b\6\b5\n\a\0=\0\b\nB\b\2\1E\6\3\3R\6ù\1276\3\0\0'\5\t\0B\3\2\0026\4\0\0'\6\n\0B\4\2\0029\5\6\0045\a\14\0005\b\f\0003\t\v\0=\t\r\b=\b\15\a9\b\16\0049\b\17\b9\b\18\b5\n\20\0009\v\16\0049\v\19\v)\rüÿB\v\2\2=\v\21\n9\v\16\0049\v\19\v)\r\4\0B\v\2\2=\v\22\n9\v\16\0049\v\23\vB\v\1\2=\v\24\n9\v\16\0049\v\25\v5\r\28\0009\14\26\0049\14\27\14=\14\29\rB\v\2\2=\v\30\n9\v\16\0043\r\31\0005\14 \0B\v\3\2=\v!\n9\v\16\0043\r\"\0005\14#\0B\v\3\2=\v$\nB\b\2\2=\b\16\a4\b\3\0005\t%\0>\t\1\b5\t&\0>\t\2\b=\b'\aB\5\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-d>\n<C-u>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\bcmp\fluasnip\17capabilities\1\0\0\nsetup\vipairs\1\4\0\0\vclangd\ncmake\npylsp\14lspconfig\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
