local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local first = [[:([0-9]*):([0-9]*)%s(.*)%s]]

local handle_rome_output = function(params, done)
  params.messages = params.output and params.output[1] and params.output[1].messages or {}
  if params.err then
    table.insert(params.messages, { message = params.err })
  end

  local diagnostics = {}
  local current_diag = {}
  for s in params.messages[1].message:gmatch("[^\r\n\n]+") do
    local _, _, row, col, rule = string.find(s, first)
    local _, _, message = string.find(s, "(×%s.*)")

    if not current_diag["row"] and row ~= nil then
      current_diag.row = row
    end
    if not current_diag["col"] and col ~= nil then
      current_diag.col = col
    end
    if not current_diag["rule"] and rule ~= nil then
      current_diag.rule = rule
    end

    if not current_diag["message"] and message ~= nil then
      current_diag.message = message
      current_diag.severity = "error"
      table.insert(diagnostics, current_diag)
      current_diag = {}
    end
  end

  done(diagnostics)
end

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

return h.make_builtin({
        name = "rome",
        meta = {
            url = "https://rome.tools",
            description = "Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.",
            notes = {
                "Currently support only JavaScript and TypeScript. See status [here](https://rome.tools/#language-support)",
            },
        },
        method = DIAGNOSTICS,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        generator_opts = {
            command = "rome",
            args = { "check", "$FILENAME", "--verbose" },
            to_stdin = true,
            format = "raw",
            check_exit_code = function(code)
              return code <= 1
            end,
            use_cache = true,
            on_output = handle_rome_output,
            dynamic_command = cmd_resolver.from_node_modules(),
            cwd = h.cache.by_bufnr(function(params)
              return u.root_pattern("rome.json")(params.bufname)
            end),
        },
        factory = h.generator_factory,
    })
