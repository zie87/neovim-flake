{lib, ...}:
with lib;
with builtins; let
  themeSubmodule.options = {
    setup = mkOption {
      description = "Lua code to initialize theme";
      type = types.str;
    };
    styles = mkOption {
      description = "The available styles for the theme";
      type = with types; nullOr (listOf str);
      default = null;
    };
    defaultStyle = mkOption {
      description = "The default style for the theme";
      type = types.str;
    };
  };
in {
  options.vim.theme = {
    supportedThemes = mkOption {
      description = "Supported themes";
      type = with types; attrsOf (submodule themeSubmodule);
    };
  };

  config.vim.theme.supportedThemes = {
    borealis = {
      setup = ''
        -- Borealis theme
        require('borealis').load()
      '';
    };
    doom-one = {
      setup = ''
        -- Add color to cursor
        vim.g.doom_one_cursor_coloring = true
        -- Set :terminal colors
        vim.g.doom_one_terminal_colors = true
        -- Enable italic comments
        vim.g.doom_one_italic_comments = true
        -- Enable TS support
        vim.g.doom_one_enable_treesitter = true
        -- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
        -- Enable transparent background
        vim.g.doom_one_transparent_background = false
        -- Pumblend transparency
        vim.g.doom_one_pumblend_enable = false
        vim.g.doom_one_pumblend_transparency = 20
        -- Plugins integration
        vim.g.doom_one_plugin_neorg = true
        vim.g.doom_one_plugin_barbar = false
        vim.g.doom_one_plugin_telescope = true
        vim.g.doom_one_plugin_neogit = true
        vim.g.doom_one_plugin_nvim_tree = true
        vim.g.doom_one_plugin_dashboard = false
        vim.g.doom_one_plugin_startify = false
        vim.g.doom_one_plugin_whichkey = true
        vim.g.doom_one_plugin_indent_blankline = true
        vim.g.doom_one_plugin_vim_illuminate = false
        vim.g.doom_one_plugin_lspsaga = false
        vim.cmd.colorscheme 'doom-one'
      '';
    };
  };
}
