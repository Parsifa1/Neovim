(local M {})
(local icon-backup {:cmp {:Codeium ""
                          :Copilot ""
                          :Copilot_alt ""
                          :TabNine ""
                          :buffer ""
                          :cmp_tabnine ""
                          :codeium ""
                          :copilot ""
                          :copilot_alt ""
                          :latex_symbols ""
                          :luasnip "󰃐"
                          :nvim_lsp ""
                          :nvim_lua ""
                          :orgmode ""
                          :path ""
                          :spell "󰓆"
                          :tmux ""
                          :treesitter ""
                          :undefined ""}
                    :dap {:Breakpoint "󰝥"
                          :BreakpointCondition "󰟃"
                          :BreakpointRejected ""
                          :LogPoint ""
                          :Pause ""
                          :Play ""
                          :RunLast "↻"
                          :StepBack ""
                          :StepInto "󰆹"
                          :StepOut "󰆸"
                          :StepOver "󰆷"
                          :Stopped ""
                          :Terminate "󰝤"}
                    :diagnostics {:Error " "
                                  :Error_alt "󰅚"
                                  :Hint "󰌵 "
                                  :Hint_alt "󰌶"
                                  :Information " "
                                  :Information_alt ""
                                  :Question " "
                                  :Question_alt ""
                                  :Warning " "
                                  :Warning_alt "󰀪"}
                    :documents {:Default ""
                                :File ""
                                :FileTree "󰙅"
                                :Files ""
                                :Import ""
                                :Symlink ""}
                    :git {:Add ""
                          :Branch ""
                          :Conflict ""
                          :Diff ""
                          :Git "󰊢"
                          :Ignore ""
                          :Mod :M
                          :Mod_alt ""
                          :Remove ""
                          :Rename ""
                          :Repo ""
                          :Staged ""
                          :Unmerged "󰘬"
                          :Unstaged ""
                          :Untracked "󰞋"}
                    :kind {:Class "󰠱"
                           :Color "󰏘"
                           :Constant "󰏿"
                           :Constructor ""
                           :Enum ""
                           :EnumMember ""
                           :Event ""
                           :Field "󰇽"
                           :File "󰈙"
                           :Folder "󰉋"
                           :Fragment ""
                           :Function "󰊕"
                           :Implementation ""
                           :Interface ""
                           :Keyword "󰌋"
                           :Macro ""
                           :Method "󰆧"
                           :Module ""
                           :Namespace "󰌗"
                           :Number ""
                           :Operator "󰆕"
                           :Package ""
                           :Parameter ""
                           :Property "󰜢"
                           :Reference ""
                           :Snippet ""
                           :StaticMethod ""
                           :Struct ""
                           :Text "󰉿"
                           :TypeAlias ""
                           :TypeParameter "󰅲"
                           :Undefined ""
                           :Unit ""
                           :Value "󰎠"
                           :Variable ""}
                    :misc {:Add "+"
                           :Added ""
                           :Campass "󰀹"
                           :Code ""
                           :Gavel ""
                           :Ghost "󰊠"
                           :Glass "󰂖"
                           :Lego ""
                           :LspAvailable "󱜙"
                           :ManUp ""
                           :NoActiveLsp "󱚧"
                           :PyEnv "󰢩"
                           :Squirrel ""
                           :Tag ""
                           :Tree ""
                           :Vbar "│"
                           :Vim ""
                           :Watch ""}
                    :type {:Array "󰅪"
                           :Boolean ""
                           :Null "󰟢"
                           :Number ""
                           :Object "󰅩"
                           :String "󰉿"}
                    :ui {:Accepted ""
                         :ArrowClosed ""
                         :ArrowOpen ""
                         :BigCircle ""
                         :BigUnfilledCircle ""
                         :BookMark "󰃃"
                         :Bug ""
                         :Calendar ""
                         :Check "󰄳"
                         :ChevronRight ""
                         :Circle ""
                         :Close "󰅖"
                         :Close_alt ""
                         :CloudDownload ""
                         :CodeAction "󰌵"
                         :Comment "󰅺"
                         :Dashboard ""
                         :DoubleSeparator "󰄾"
                         :Emoji "󰱫"
                         :EmptyFolder ""
                         :EmptyFolderOpen ""
                         :File "󰈤"
                         :Fire ""
                         :Folder ""
                         :FolderOpen ""
                         :FolderWithHeart "󱃪"
                         :Gear ""
                         :History "󰄉"
                         :Incoming "󰏷"
                         :Indicator ""
                         :Keyboard ""
                         :Left ""
                         :List ""
                         :Lock "󰍁"
                         :Modified "✥"
                         :Modified_alt ""
                         :NewFile ""
                         :Newspaper ""
                         :Note "󰍨"
                         :Outgoing "󰏻"
                         :Package ""
                         :Pencil "󰏫"
                         :Perf "󰅒"
                         :Play ""
                         :Project ""
                         :Right ""
                         :RootFolderOpened ""
                         :Search "󰍉"
                         :Separator ""
                         :SignIn ""
                         :SignOut ""
                         :Sort ""
                         :Spell "󰓆"
                         :Square ""
                         :Symlink ""
                         :SymlinkFolder ""
                         :Tab ""
                         :Table ""
                         :Telescope ""}
                    :vsc_kind {:Array ""
                               :Boolean ""
                               :Class ""
                               :Color ""
                               :Constant ""
                               :Constructor ""
                               :Enum ""
                               :EnumMember ""
                               :Event ""
                               :Field ""
                               :File ""
                               :Folder ""
                               :Function ""
                               :Interface ""
                               :Key ""
                               :Keyword ""
                               :Method ""
                               :Module ""
                               :Namespace ""
                               :Null ""
                               :Number ""
                               :Object ""
                               :Operator ""
                               :Package ""
                               :Property ""
                               :Reference ""
                               :Snippet ""
                               :String ""
                               :Struct ""
                               :Text ""
                               :TypeParameter ""
                               :Unit ""
                               :Value ""
                               :Variable ""}})

(set M.border :rounded)
(set M.prefer_tabpage false)
(fn M.width []
  (let [columns vim.go.columns]
    (or (and (> (math.floor (* columns 0.15)) 28) (math.floor (* columns 0.15)))
        28)))

(fn append-space [icons]
  (let [result {}]
    (each [k v (pairs icons)] (tset result k (.. v " ")))
    result))

(fn M.set [mode keys func ...]
  (let [options {:noremap true :silent true}
        arg [...]]
    (when (> (length arg) 0) (local desc (. arg 1)) (set options.desc desc))
    (vim.keymap.set mode keys func options)))

(fn M.register [server lsp config]
  (each [_ i (ipairs lsp)]
    (tset server i (or (. config i) {}))
    (local capabilities (vim.lsp.protocol.make_client_capabilities))
    (set capabilities.textDocument.foldingRange {:dynamicRegistration false})
    (tset (. server i) :capabilities capabilities))
  server)

(set M.icons {:ui icon-backup.ui
              :kind icon-backup.kind
              :diagnostic icon-backup.diagnostics
              :kind_with_space (append-space icon-backup.kind)
              :vsc_kind icon-backup.vsc_kind})

M
