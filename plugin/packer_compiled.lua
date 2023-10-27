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
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme nightfox\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nI\0\3\n\0\4\0\n5\3\0\0006\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\bset\vkeymap\bvim\1\0\1\vbuffer\2É\6\1\0\6\0\28\0C3\0\0\0\18\1\0\0'\3\1\0'\4\2\0'\5\3\0B\1\4\1\18\1\0\0'\3\1\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\1\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\1\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\1\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\1\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\1\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\1\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\1\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\20\0'\4\18\0'\5\21\0B\1\4\1\18\1\0\0'\3\1\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\1\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\1\0'\4\26\0'\5\27\0B\1\4\1K\0\1\0,<cmd>lua vim.diagnostic.goto_next()<cr>\a]d,<cmd>lua vim.diagnostic.goto_prev()<cr>\a[d-<cmd>lua vim.diagnostic.open_float()<cr>\agl1<cmd>lua vim.lsp.buf.range_code_action()<cr>\6x+<cmd>lua vim.lsp.buf.code_action()<cr>\t<F4>&<cmd>lua vim.lsp.buf.rename()<cr>\t<F2>.<cmd>lua vim.lsp.buf.signature_help()<cr>\ags*<cmd>lua vim.lsp.buf.references()<cr>\agr/<cmd>lua vim.lsp.buf.type_definition()<cr>\ago.<cmd>lua vim.lsp.buf.implementation()<cr>\agi+<cmd>lua vim.lsp.buf.declaration()<cr>\agD*<cmd>lua vim.lsp.buf.definition()<cr>\agd%<cmd>lua vim.lsp.buf.hover()<cr>\14<leader>s\6n\0-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expand_\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\fluasnip\bâ‹—\vbuffer\aÎ©\rnvim_lsp\aÎ»\tpath\tðŸ–«O\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\3À\tjump\rjumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\3À\tjump\rjumpableš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\tjump\rjumpable\21select_prev_item\fvisibleÞ\n\1\0\r\0Q\0\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\1\t\0009\1\n\0016\2\0\0009\2\f\2'\4\r\0009\5\v\0016\6\a\0'\b\14\0B\6\2\0029\6\15\6B\6\1\0A\2\2\2=\2\v\0019\2\16\0009\2\17\0024\4\0\0B\2\2\0019\2\18\0009\2\17\0024\4\0\0B\2\2\0019\2\19\0009\2\17\0024\4\0\0B\2\2\0019\2\20\0009\2\17\0024\4\0\0B\2\2\0019\2\21\0009\2\17\0024\4\0\0B\2\2\0016\2\a\0'\4\22\0B\2\2\0029\2\23\2B\2\1\0016\2\a\0'\4\24\0B\2\2\0026\3\a\0'\5\25\0B\3\2\0025\4\28\0009\5\26\0029\5\27\5=\5\29\0049\5\17\0025\a!\0005\b\31\0003\t\30\0=\t \b=\b\"\a4\b\5\0005\t#\0>\t\1\b5\t$\0>\t\2\b5\t%\0>\t\3\b5\t&\0>\t\4\b=\b'\a5\b+\0009\t(\0029\t)\t9\t*\tB\t\1\2=\t,\b=\b)\a5\b.\0005\t-\0=\t/\b3\t0\0=\t1\b=\b2\a5\b5\0009\t3\0029\t4\t\18\v\4\0B\t\2\2=\t6\b9\t3\0029\t7\t\18\v\4\0B\t\2\2=\t8\b9\t3\0029\t4\t\18\v\4\0B\t\2\2=\t9\b9\t3\0029\t7\t\18\v\4\0B\t\2\2=\t:\b9\t3\0029\t;\t)\vüÿB\t\2\2=\t<\b9\t3\0029\t;\t)\v\4\0B\t\2\2=\t=\b9\t3\0029\t>\tB\t\1\2=\t?\b9\t3\0029\t@\t5\vA\0B\t\2\2=\tB\b9\t3\0029\t@\t5\vC\0B\t\2\2=\tD\b9\t3\0023\vE\0005\fF\0B\t\3\2=\tG\b9\t3\0023\vH\0005\fI\0B\t\3\2=\tJ\b9\t3\0023\vK\0005\fL\0B\t\3\2=\tM\b9\t3\0023\vN\0005\fO\0B\t\3\2=\tP\b=\b3\aB\5\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-b>\1\3\0\0\6i\6s\0\n<C-f>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\1\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\n<C-d>\n<C-u>\16scroll_docs\n<C-n>\n<C-p>\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\1\0\0\rbordered\vwindow\vconfig\fsources\1\0\2\19keyword_length\3\2\tname\fluasnip\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\2\19keyword_length\3\1\tname\rnvim_lsp\1\0\1\tname\tpath\fsnippet\1\0\0\vexpand\1\0\0\0\rbehavior\1\0\0\vSelect\19SelectBehavior\fluasnip\bcmp\14lazy_load luasnip.loaders.from_vscode\rocamllsp\vlua_ls\npylsp\ncmake\nsetup\vclangd\25default_capabilities\17cmp_nvim_lsp\nforce\20tbl_deep_extend\17capabilities\19default_config\tutil\14lspconfig\frequire\rcallback\0\1\0\1\tdesc\16LSP actions\14LspAttach\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÑ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\t\0\0\6c\bcpp\blua\bvim\vvimdoc\nquery\vpython\nocaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aloysobek/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
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
    config = { "\27LJ\2\nq\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14autochdir\2\17open_mapping\14<leader>t\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
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
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14autochdir\2\17open_mapping\14<leader>t\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\t\0\0\6c\bcpp\blua\bvim\vvimdoc\nquery\vpython\nocaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nI\0\3\n\0\4\0\n5\3\0\0006\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\bset\vkeymap\bvim\1\0\1\vbuffer\2É\6\1\0\6\0\28\0C3\0\0\0\18\1\0\0'\3\1\0'\4\2\0'\5\3\0B\1\4\1\18\1\0\0'\3\1\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\1\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\1\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\1\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\1\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\1\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\1\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\1\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\20\0'\4\18\0'\5\21\0B\1\4\1\18\1\0\0'\3\1\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\1\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\1\0'\4\26\0'\5\27\0B\1\4\1K\0\1\0,<cmd>lua vim.diagnostic.goto_next()<cr>\a]d,<cmd>lua vim.diagnostic.goto_prev()<cr>\a[d-<cmd>lua vim.diagnostic.open_float()<cr>\agl1<cmd>lua vim.lsp.buf.range_code_action()<cr>\6x+<cmd>lua vim.lsp.buf.code_action()<cr>\t<F4>&<cmd>lua vim.lsp.buf.rename()<cr>\t<F2>.<cmd>lua vim.lsp.buf.signature_help()<cr>\ags*<cmd>lua vim.lsp.buf.references()<cr>\agr/<cmd>lua vim.lsp.buf.type_definition()<cr>\ago.<cmd>lua vim.lsp.buf.implementation()<cr>\agi+<cmd>lua vim.lsp.buf.declaration()<cr>\agD*<cmd>lua vim.lsp.buf.definition()<cr>\agd%<cmd>lua vim.lsp.buf.hover()<cr>\14<leader>s\6n\0-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expand_\0\2\4\0\4\0\0065\2\0\0009\3\2\0009\3\3\0038\3\3\2=\3\1\1L\1\2\0\tname\vsource\tmenu\1\0\4\fluasnip\bâ‹—\vbuffer\aÎ©\rnvim_lsp\aÎ»\tpath\tðŸ–«O\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3\1\0B\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\3À\tjump\rjumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\3À\tjump\rjumpableš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\tjump\rjumpable\21select_prev_item\fvisibleÞ\n\1\0\r\0Q\0\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0003\4\5\0=\4\6\3B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\1\t\0009\1\n\0016\2\0\0009\2\f\2'\4\r\0009\5\v\0016\6\a\0'\b\14\0B\6\2\0029\6\15\6B\6\1\0A\2\2\2=\2\v\0019\2\16\0009\2\17\0024\4\0\0B\2\2\0019\2\18\0009\2\17\0024\4\0\0B\2\2\0019\2\19\0009\2\17\0024\4\0\0B\2\2\0019\2\20\0009\2\17\0024\4\0\0B\2\2\0019\2\21\0009\2\17\0024\4\0\0B\2\2\0016\2\a\0'\4\22\0B\2\2\0029\2\23\2B\2\1\0016\2\a\0'\4\24\0B\2\2\0026\3\a\0'\5\25\0B\3\2\0025\4\28\0009\5\26\0029\5\27\5=\5\29\0049\5\17\0025\a!\0005\b\31\0003\t\30\0=\t \b=\b\"\a4\b\5\0005\t#\0>\t\1\b5\t$\0>\t\2\b5\t%\0>\t\3\b5\t&\0>\t\4\b=\b'\a5\b+\0009\t(\0029\t)\t9\t*\tB\t\1\2=\t,\b=\b)\a5\b.\0005\t-\0=\t/\b3\t0\0=\t1\b=\b2\a5\b5\0009\t3\0029\t4\t\18\v\4\0B\t\2\2=\t6\b9\t3\0029\t7\t\18\v\4\0B\t\2\2=\t8\b9\t3\0029\t4\t\18\v\4\0B\t\2\2=\t9\b9\t3\0029\t7\t\18\v\4\0B\t\2\2=\t:\b9\t3\0029\t;\t)\vüÿB\t\2\2=\t<\b9\t3\0029\t;\t)\v\4\0B\t\2\2=\t=\b9\t3\0029\t>\tB\t\1\2=\t?\b9\t3\0029\t@\t5\vA\0B\t\2\2=\tB\b9\t3\0029\t@\t5\vC\0B\t\2\2=\tD\b9\t3\0023\vE\0005\fF\0B\t\3\2=\tG\b9\t3\0023\vH\0005\fI\0B\t\3\2=\tJ\b9\t3\0023\vK\0005\fL\0B\t\3\2=\tM\b9\t3\0023\vN\0005\fO\0B\t\3\2=\tP\b=\b3\aB\5\2\0012\0\0€K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-b>\1\3\0\0\6i\6s\0\n<C-f>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\1\n<C-y>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\n<C-d>\n<C-u>\16scroll_docs\n<C-n>\n<C-p>\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tmenu\tabbr\tkind\18documentation\1\0\0\rbordered\vwindow\vconfig\fsources\1\0\2\19keyword_length\3\2\tname\fluasnip\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\2\19keyword_length\3\1\tname\rnvim_lsp\1\0\1\tname\tpath\fsnippet\1\0\0\vexpand\1\0\0\0\rbehavior\1\0\0\vSelect\19SelectBehavior\fluasnip\bcmp\14lazy_load luasnip.loaders.from_vscode\rocamllsp\vlua_ls\npylsp\ncmake\nsetup\vclangd\25default_capabilities\17cmp_nvim_lsp\nforce\20tbl_deep_extend\17capabilities\19default_config\tutil\14lspconfig\frequire\rcallback\0\1\0\1\tdesc\16LSP actions\14LspAttach\24nvim_create_autocmd\bapi\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme nightfox\bcmd\bvim\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)

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
