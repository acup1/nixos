{lib, pkgs, ...}: let
  mapCommand = before: command: {
    inherit before;
    commands = [command];
    silent = true;
  };
  normalKey = key: command: {
    inherit key command;
    when = "editorTextFocus && vim.active && vim.mode == 'Normal' && !inDebugRepl";
  };
  toggleTerminal = "workbench.action.terminal.toggleTerminal";
  terminalWhen = "terminalFocus || (editorTextFocus && vim.active && !inDebugRepl)";
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-vira-vsc-vira-theme"
    ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions =
        [pkgs.vscode-extensions.vscodevim.vim]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            publisher = "rocketseat";
            name = "theme-omni";
            version = "1.0.12";
            hash = "sha256-rZzyMc9iCVjEFmWCiLuKqohBwSbqoKEYRR2Bn5f6dbU=";
            meta.license = lib.licenses.mit;
          }
          {
            publisher = "vira";
            name = "vsc-vira-theme";
            version = "2026.9.2";
            hash = "sha256-lAXdlpTLWZX2Ej2y42i1YV8fqCMJYM+jJHsBkIykhpA=";
            meta.license = lib.licenses.unfree;
          }
        ];

      userSettings = {
        "workbench.colorTheme" = "Omni";
        "workbench.iconTheme" = "vira-icons-palenight";
        "workbench.productIconTheme" = "viraUIIcons";
        # Keep the chosen Vira icons independent of the Omni color theme.
        "viraTheme.syncThemesAndIcons" = false;
        "viraTheme.syncProductIcons" = false;

        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.detectIndentation" = false;
        "editor.lineNumbers" = "relative";
        "editor.formatOnSave" = true;
        "workbench.editor.enablePreview" = false;

        "vim.leader" = "<space>";
        "vim.useSystemClipboard" = true;
        "vim.useCtrlKeys" = true;
        "vim.hlsearch" = true;
        "vim.incsearch" = true;
        # nvf defaults to case-sensitive search.
        "vim.ignorecase" = false;
        "vim.smartcase" = false;
        "vim.handleKeys" = {
          "<C-s>" = false;
        };

        "vim.normalModeKeyBindingsNonRecursive" = [
          (mapCommand ["<Esc>"] ":nohlsearch")
          (mapCommand ["<leader>" "e"] "workbench.action.toggleSidebarVisibility")
          (mapCommand ["<leader>" "c"] "workbench.action.closeActiveEditor")
          (mapCommand ["<leader>" "/"] "editor.action.commentLine")

          # Native equivalents of the enabled Telescope and lazygit mappings.
          (mapCommand ["<leader>" "f" "f"] "workbench.action.quickOpen")
          (mapCommand ["<leader>" "f" "g"] "workbench.action.findInFiles")
          (mapCommand ["<leader>" "f" "b"] "workbench.action.showAllEditors")
          (mapCommand ["<leader>" "f" "t"] "workbench.action.showCommands")
          (mapCommand ["<leader>" "f" "s"] "workbench.action.gotoSymbol")
          (mapCommand ["<leader>" "f" "l" "s" "b"] "workbench.action.gotoSymbol")
          (mapCommand ["<leader>" "f" "l" "s" "w"] "workbench.action.showAllSymbols")
          (mapCommand ["<leader>" "f" "l" "r"] "editor.action.goToReferences")
          (mapCommand ["<leader>" "f" "l" "i"] "editor.action.goToImplementation")
          (mapCommand ["<leader>" "f" "l" "D"] "editor.action.revealDefinition")
          (mapCommand ["<leader>" "f" "l" "t"] "editor.action.goToTypeDefinition")
          (mapCommand ["<leader>" "f" "l" "d"] "workbench.actions.view.problems")
          (mapCommand ["<leader>" "f" "v" "s"] "workbench.view.scm")
          (mapCommand ["<leader>" "g" "g"] "workbench.view.scm")

          # nvf's default LSP mappings.
          (mapCommand ["<leader>" "l" "g" "d"] "editor.action.revealDefinition")
          (mapCommand ["<leader>" "l" "g" "D"] "editor.action.revealDeclaration")
          (mapCommand ["<leader>" "l" "g" "t"] "editor.action.goToTypeDefinition")
          (mapCommand ["<leader>" "l" "g" "i"] "editor.action.goToImplementation")
          (mapCommand ["<leader>" "l" "g" "r"] "editor.action.goToReferences")
          (mapCommand ["<leader>" "l" "g" "n"] "editor.action.marker.next")
          (mapCommand ["<leader>" "l" "g" "p"] "editor.action.marker.prev")
          (mapCommand ["<leader>" "l" "e"] "editor.action.showHover")
          (mapCommand ["<leader>" "l" "S"] "workbench.action.gotoSymbol")
          (mapCommand ["<leader>" "l" "w" "s"] "workbench.action.showAllSymbols")
          (mapCommand ["<leader>" "l" "h"] "editor.action.showHover")
          (mapCommand ["<leader>" "l" "s"] "editor.action.triggerParameterHints")
          (mapCommand ["<leader>" "l" "n"] "editor.action.rename")
          (mapCommand ["<leader>" "l" "a"] "editor.action.quickFix")
          (mapCommand ["<leader>" "l" "f"] "editor.action.formatDocument")

          # VS Code uses its terminal panel in place of ToggleTerm's float.
          (mapCommand ["<leader>" "t" "f"] toggleTerminal)
          {
            before = ["<leader>" "t" "h"];
            commands = [
              "workbench.action.positionPanelBottom"
              "workbench.action.terminal.focus"
            ];
            silent = true;
          }
          {
            before = ["<leader>" "t" "v"];
            commands = [
              "workbench.action.positionPanelRight"
              "workbench.action.terminal.focus"
            ];
            silent = true;
          }
        ];

        "vim.visualModeKeyBindingsNonRecursive" = [
          (mapCommand ["<leader>" "/"] "editor.action.commentLine")
        ];

        "terminal.integrated.commandsToSkipShell" = [
          toggleTerminal
          "workbench.action.focusActiveEditorGroup"
        ];
      };

      keybindings = [
        # Native bindings also work when Vim does not receive Tab or Ctrl keys.
        (normalKey "tab" "workbench.action.nextEditor")
        (normalKey "shift+tab" "workbench.action.previousEditor")
        (normalKey "ctrl+up" "workbench.action.increaseViewHeight")
        (normalKey "ctrl+down" "workbench.action.decreaseViewHeight")
        (normalKey "ctrl+left" "workbench.action.decreaseViewWidth")
        (normalKey "ctrl+right" "workbench.action.increaseViewWidth")
        {
          key = "ctrl+s";
          command = "workbench.action.files.save";
          when = "editorTextFocus && vim.active && !inDebugRepl";
        }
        {
          key = "ctrl+'";
          command = toggleTerminal;
          when = terminalWhen;
        }
        {
          key = "ctrl+t";
          command = toggleTerminal;
          when = terminalWhen;
        }
        {
          key = "escape";
          command = "workbench.action.focusActiveEditorGroup";
          when = "terminalFocus && !terminalFindVisible && !terminalSuggestWidgetVisible";
        }
      ];
    };
  };
}
