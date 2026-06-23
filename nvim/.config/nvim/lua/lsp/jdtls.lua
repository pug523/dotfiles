local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local root_files = {
  "settings.gradle",
  "settings.gradle.kts",
  "build.gradle",
  "build.gradle.kts",
  "pom.xml",
  ".git",
}

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

  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- decompile

      format = {
        enabled = true,
        settings = {
          url = (function()
            local buf_name = vim.api.nvim_buf_get_name(0)
            local root_files = vim.fs.find({
              "java_format.xml",
              "eclipse-formatter.xml",
              "eclipse-java-style.xml",
            }, {
              upward = true,
              path = vim.fs.dirname(buf_name),
            })
            if #root_files > 0 then
              return root_files[1]
            end
            return nil
          end)(),
          profile = "Default",
        },
      },

      formatter = {
        insertSpaces = true,
        tabSize = 4,
      },

      configuration = {
        updateBuildConfiguration = "automatic",
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
