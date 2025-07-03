-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Use Zsh (or change to "/bin/bash" or your shell of choice)
vim.opt.shell = "/bin/zsh"
vim.opt.shellcmdflag = "-l -i -c" -- login + interactive
vim.cmd [[
  let &shellredir = '2>&1 | tee %s'
  let &shellpipe  = '2>&1 | tee %s'
  set shellquote= shellxquote=
]]

-- macOS clipboard via pbcopy/pbpaste
vim.g.clipboard               = {
  copy = {
    ["+"] = "pbcopy",
    ["*"] = "pbcopy",
  },
  paste = {
    ["+"] = "pbpaste",
    ["*"] = "pbpaste",
  },
  cache_enabled = 0,
}

lvim.builtin.custom           = lvim.builtin.custom or {}
lvim.builtin.custom.cmdheight = 0 -- Hide command line when not in use (Neovim 0.10+)

-- Hamshad’s options
vim.opt.relativenumber        = true
vim.opt.wrap                  = true
vim.opt.tabstop               = 4
vim.opt.scrolloff             = 15

-- Hamshad’s key mappings
vim.keymap.set('n', '<leader>o', 'o<esc>')
vim.keymap.set('n', '<leader>O', 'O<esc>')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>p', '"_dP')


-- TODO: Configure the lombok for JDTLS for Annotations Processing
-- 1. Go to the jdtls executing python script
-- /Users/mokshassd/.local/share/nvim/mason/packages/jdtls/bin/jdtls.py
-- 2. Add the following lines to the exec-args list:
-- "-javaagent:" + str(jdtls_base_path / "lombok.jar"),
-- It would look like this:
-- exec_args = ["-Declipse.application=org.eclipse.jdt.ls.core.id1",
--              "-Dosgi.bundles.defaultStartLevel=4",
--              "-Declipse.product=org.eclipse.jdt.ls.core.product",
--              "-Dosgi.checkConfiguration=true",
--              "-Dosgi.sharedConfiguration.area=" + shared_config_path,
--              "-Dosgi.sharedConfiguration.area.readOnly=true",
--              "-Dosgi.configuration.cascaded=true",
--              "-Xms1G",
--              "--add-modules=ALL-SYSTEM",
--              "--add-opens", "java.base/java.util=ALL-UNNAMED",
--              "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--              "-javaagent:" + str(jdtls_base_path / "lombok.jar")] \
--             + known_args.jvm_arg \
--             + ["-jar", jar_path,
--                "-data", known_args.data] \
--             + args
-- 3. Save the file
