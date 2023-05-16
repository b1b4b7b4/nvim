local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local l = require("luasnip.extras").lambda

local function FilenamefirstToUpper()
    return ((vim.fn.expand('%:t:r')):gsub("^%l", string.upper))
end


ls.add_snippets("cpp", {
    s("log", {
        t("std::cout << "), i(1), t(" << std::endl;")
    })
})

ls.add_snippets("typescript", {
    s("cl", fmt("console.log({})", { i(1) })),
    s("ut", fmt(
        "const {filename} = {}\n\nexport default {filename}", {
            filename = f(function()
                return FilenamefirstToUpper()
            end),
            i(1, "() => {}")
        }
    )),
})

ls.add_snippets("typescriptreact", {
    s("rh", fmt([[
        import * as react from "react"
        interface props {{
        }}
        const {filename}:react.fc<props> = () => {{
            return ({})
        }}
		]],
        {
            filename = f(function()
                return FilenamefirstToUpper()
            end),
            i(2, "<div>bomb<div>"),
        }
    )
    ),
})
