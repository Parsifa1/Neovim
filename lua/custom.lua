local M = {}

local icon_backup = {
    vsc_kind = {
        Array = "",
        Boolean = "",
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Key = "",
        Keyword = "",
        Method = "",
        Module = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Operator = "",
        Package = "",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "",
        Struct = "",
        Text = "",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "",
    },
    kind = {
        Class = "󰠱",
        Color = "󰏘",
        Constant = "󰏿",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "󰇽",
        File = "󰈙",
        Folder = "󰉋",
        Fragment = "",
        Function = "󰊕",
        Interface = "",
        Implementation = "",
        Keyword = "󰌋",
        Method = "󰆧",
        Module = "",
        Namespace = "󰌗",
        Number = "",
        Operator = "󰆕",
        Package = "",
        Property = "󰜢",
        Reference = "",
        Snippet = "",
        Struct = "",
        Text = "󰉿",
        TypeParameter = "󰅲",
        Undefined = "",
        Unit = "",
        Value = "󰎠",
        Variable = "",
        -- ccls-specific icons.
        TypeAlias = "",
        Parameter = "",
        StaticMethod = "",
        Macro = "",
    },
    type = {
        Array = "󰅪",
        Boolean = "",
        Null = "󰟢",
        Number = "",
        Object = "󰅩",
        String = "󰉿",
    },
    documents = {
        Default = "",
        File = "",
        Files = "",
        FileTree = "󰙅",
        Import = "",
        Symlink = "",
    },
    git = {
        Add = "",
        Branch = "",
        Diff = "",
        Git = "󰊢",
        Ignore = "",
        Mod = "M",
        Mod_alt = "",
        Remove = "",
        Rename = "",
        Repo = "",
        Unmerged = "󰘬",
        Untracked = "󰞋",
        Unstaged = "",
        Staged = "",
        Conflict = "",
    },
    ui = {
        Accepted = "",
        ArrowClosed = "",
        ArrowOpen = "",
        BigCircle = "",
        BigUnfilledCircle = "",
        BookMark = "󰃃",
        Bug = "",
        Calendar = "",
        Check = "󰄳",
        ChevronRight = "",
        Circle = "",
        Close = "󰅖",
        Close_alt = "",
        CloudDownload = "",
        Comment = "󰅺",
        CodeAction = "󰌵",
        Dashboard = "",
        Emoji = "󰱫",
        EmptyFolder = "",
        EmptyFolderOpen = "",
        File = "󰈤",
        Fire = "",
        Folder = "",
        FolderOpen = "",
        FolderWithHeart = "󱃪",
        Gear = "",
        History = "󰄉",
        Incoming = "󰏷",
        Indicator = "",
        Keyboard = "",
        Left = "",
        List = "",
        Square = "",
        SymlinkFolder = "",
        Lock = "󰍁",
        Modified = "✥",
        Modified_alt = "",
        NewFile = "",
        Newspaper = "",
        Note = "󰍨",
        Outgoing = "󰏻",
        Package = "",
        Pencil = "󰏫",
        Perf = "󰅒",
        Play = "",
        Project = "",
        Right = "",
        RootFolderOpened = "",
        Search = "󰍉",
        Separator = "",
        DoubleSeparator = "󰄾",
        SignIn = "",
        SignOut = "",
        Sort = "",
        Spell = "󰓆",
        Symlink = "",
        Tab = "",
        Table = "",
        Telescope = "",
    },
    diagnostics = {
        Error = " ",
        Warning = " ",
        Information = " ",
        Question = " ",
        Hint = "󰌵 ",
        -- Holo version
        Error_alt = "󰅚",
        Warning_alt = "󰀪",
        Information_alt = "",
        Question_alt = "",
        Hint_alt = "󰌶",
    },
    misc = {
        Campass = "󰀹",
        Code = "",
        Gavel = "",
        Glass = "󰂖",
        NoActiveLsp = "󱚧",
        PyEnv = "󰢩",
        Squirrel = "",
        Tag = "",
        Tree = "",
        Watch = "",
        Lego = "",
        LspAvailable = "󱜙",
        Vbar = "│",
        Add = "+",
        Added = "",
        Ghost = "󰊠",
        ManUp = "",
        Vim = "",
    },
    cmp = {
        Codeium = "",
        TabNine = "",
        Copilot = "",
        Copilot_alt = "",
        -- Add source-specific icons here
        buffer = "",
        cmp_tabnine = "",
        codeium = "",
        copilot = "",
        copilot_alt = "",
        latex_symbols = "",
        luasnip = "󰃐",
        nvim_lsp = "",
        nvim_lua = "",
        orgmode = "",
        path = "",
        spell = "󰓆",
        tmux = "",
        treesitter = "",
        undefined = "",
    },
    dap = {
        Breakpoint = "󰝥",
        BreakpointCondition = "󰟃",
        BreakpointRejected = "",
        LogPoint = "",
        Pause = "",
        Play = "",
        RunLast = "↻",
        StepBack = "",
        StepInto = "󰆹",
        StepOut = "󰆸",
        StepOver = "󰆷",
        Stopped = "",
        Terminate = "󰝤",
    },
}
M.border = "rounded"

M.prefer_tabpage = false

-- Width of side windows
M.width = function()
    local columns = vim.go.columns
    return math.floor(columns * 0.15) > 28 and math.floor(columns * 0.15) or 28
end

local append_space = function(icons)
    local result = {}
    for k, v in pairs(icons) do
        result[k] = v .. " "
    end
    return result
end

function M.set(mode, keys, func, ...)
    local options = { noremap = true, silent = true }
    local arg = { ... }
    if #arg > 0 then
        local desc = arg[1]
        options.desc = desc
    end

    vim.keymap.set(mode, keys, func, options)
end

function M.register(server, lsp, config)
    for _, i in ipairs(lsp) do
        server[i] = config[i] or {}
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
        server[i]["capabilities"] = capabilities
    end
end

M.icons = {
    -- LSP diagnostic
    diagnostic = icon_backup.diagnostics,
    -- LSP kinds
    kind = icon_backup.kind,
    vsc_kind = icon_backup.vsc_kind,
    ui = icon_backup.ui,
    kind_with_space = append_space(icon_backup.kind),
}

return M
