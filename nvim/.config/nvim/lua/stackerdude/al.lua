local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
function al()
    print("Inside al")
end

-- our picker function: colors
function colors(opts)
    opts = { require("telescope.themes").get_dropdown {} }
    pickers.new(opts, {
        prompt_title = "colors",
        finder = finders.new_table {
            results = {
                { "red",   "#ff0000" },
                { "green", "#00ff00" },
                { "blue",  "#0000ff" },
            },
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry[1],
                    ordinal = entry[1],
                }
            end
        },
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                -- print(vim.inspect(selection))
                vim.api.nvim_put({ selection[1] }, "", false, true)
            end)
            return true
        end,
        sorter = conf.generic_sorter(opts),
    }):find()
end
