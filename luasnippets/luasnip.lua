local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Keymaps to navigate
vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

--[[
ls.add_snippets("lua", {
    s("test", {
	t('print("hello '),
	i(1),
	t(' world and goodbye my '),
	i(2),
	t('")')
    })
})
]]--

ls.add_snippets("tex", {
    s("header", fmt(
	[[
	    \documentclass{{article}}
	    \usepackage{{hyperref}}
	    \usepackage[left=2cm, right=2cm, top=1cm]{{geometry}}
	    \usepackage{{graphicx}}
	    \usepackage{{xeCJK}}

	    \setCJKmainfont{{Source Han Serif}}

	    \title{{{}}}
	    \author{{}}
	    
	    \begin{{document}}
	    \maketitle

	    {}

	    \end{{document}}
	]], {
	    i(1), i(2)
	}
    )),
    s("unordered", fmt(
	[[
\begin{{itemize}}
    \item {}
\end{{itemize}}
	]], {
	    i(1)
	}    
    )),
    s("ordered", fmt(
	[[
\begin{{enumerate}}
    \item {}
\end{{enumerate}}
	]], {
	    i(1)
	}
    )),
    s("\\item", fmt(
	[[
	    \item {}
	]], {
	    i()
	}
    )),
})

ls.add_snippets("java", {
    s("pub", fmt(
	[[
	public class Main {{
	    public static void main(String[] args){{
		{}
	    }}
	}}
	]], {
	    i(1)
	}
    ))
})
