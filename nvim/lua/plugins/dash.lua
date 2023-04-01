function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local function file_exists(name)
  local f = io.open(name, "r")
  if f~=nil then io.close(f) return true else return false end
end

if os.capture("uname", false) == "Darwin" and file_exists('/Applications/Setapp/Dash.app/') then
  return {
    "mrjones2014/dash.nvim",
    event = "VeryLazy",
    build = "make install",
    config = function()
      require("dash").setup({
        dash_app_path = "/Applications/Setapp/Dash.app/",
        search_engine = "google",
        file_type_keywords = {
          ruby = { "ruby", "rails" },
          php = { "php", "laravel", "statamic" },
        },
      })
    end,
  }
end
