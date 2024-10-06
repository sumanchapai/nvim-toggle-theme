local M = {}
function M.config(options)
  -- Get the themes table provided by the user
  M.themes = options.themes or {}

  -- Create a reverse index from theme to its index
  -- avoids calculating the index when theme update is requested
  M.themes_index = {}
  for k, v in pairs(M.themes) do
    M.themes_index[v] = k
  end

  -- Set the first theme in the table as the current theme
  local set_theme = options.set_first_as_default
  if set_theme == nil or set_theme then
    if #M.themes > 0 then
      vim.cmd("colorscheme " .. M.themes[1])
    end
  end
end

function M.Toggle()
  if #M.themes == 0 then
    print("No themes defined")
  end

  -- set current theme index (0 if the current theme isn't in the themes table)
  local current_theme_index = M.themes_index[vim.g.colors_name] or 0
  local new_theme_index = (current_theme_index % #M.themes) + 1
  -- update theme using colorscheme command
  vim.cmd("colorscheme " .. M.themes[new_theme_index])
end

return M
