local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

vim.lsp.config["jdtls"] = {
  cmd = {
    "jdtls",
    "-configuration",
    home .. "/.cache/jdtls/config",
    "-data",
    workspace_dir,
    "--jvm-arg=-Xms1g",
    "--jvm-arg=-Xmx4g",
    "--jvm-arg=-XX:+UseG1GC",
    "--jvm-arg=-XX:+UseStringDeduplication",
  },

  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- decompile

      format = {
        enabled = false,
        -- comments = {
        --   enabled = false,
        -- },
        -- settings = {
        --   url = "",
        --   profile = "GoogleStyle",
        --   ["org.eclipse.jdt.core.formatter.lineSplit"] = "300",
        --   ["org.eclipse.jdt.core.formatter.comment.line_length"] = "300",

        --   ["org.eclipse.jdt.core.formatter.comment.format_header"] = "false",
        --   ["org.eclipse.jdt.core.formatter.comment.format_source_code"] = "false",
        -- },
      },

      formatter = {
        insertSpaces = true,
        tabSize = 4,
      },

      -- import filter for minecraft sources
      import = {
        gradle = {
          enabled = true,
          wrapper = { enabled = true },
        },
        maven = { enabled = true },
        exclusions = {
          "**/node_modules/**",
          "**/.metadata/**",
          "**/archetype-resources/**",
          "**/META-INF/maven/**",
        },
      },

      -- completion filter which hides unused classes
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "sun.*",
          "org.graalvm.*",
          "com.oracle.*",
        },
      },

      -- static analysis
      autofix = { enabled = true },
      sources = {
        organizeImports = {
          starThreshold = 99, -- do not star import
          staticStarThreshold = 99,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },

  on_attach = vim.lsp.config["*"].on_attach,
}
