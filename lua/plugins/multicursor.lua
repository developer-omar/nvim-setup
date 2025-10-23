-- https://github.com/jake-stewart/multicursor.nvim
-- Multiple cursors in Neovim which work how you expect. Now with help pages! :h multicursor.

return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor.
		set({ "n", "x" }, "<s-c-up>", function()
			mc.lineAddCursor(-1)
		end)
		set({ "n", "x" }, "<s-c-down>", function()
			mc.lineAddCursor(1)
		end)
		set({ "n", "x" }, "<up>", function()
			mc.lineSkipCursor(-1)
		end)
		set({ "n", "x" }, "<down>", function()
			mc.lineSkipCursor(1)
		end)

		-- Add or skip adding a new cursor by matching word/selection
		set({ "n", "x" }, "<M-n>", function()
			mc.matchAddCursor(1)
		end)
		set({ "n", "x" }, "<M-s>", function()
			mc.matchSkipCursor(1)
		end)
		set({ "n", "x" }, "<M-N>", function()
			mc.matchAddCursor(-1)
		end)
		set({ "n", "x" }, "<M-S>", function()
			mc.matchSkipCursor(-1)
		end)

		-- Append/insert for each line of visual selections.
		-- Similar to block selection insertion.
		set("x", "I", mc.insertVisual) -- Set the cursors at beginning of line
		set("x", "A", mc.appendVisual) -- Set the cursors at the end of line

		-- match new cursors within visual selections by regex.
		set("x", "M", mc.matchCursors)

		-- Add and remove cursors with control + left click.
		set("n", "<c-leftmouse>", mc.handleMouse)
		set("n", "<c-leftdrag>", mc.handleMouseDrag)
		set("n", "<c-leftrelease>", mc.handleMouseRelease)

		-- Disable and enable cursors.
		set({ "n", "x" }, "<c-q>", mc.toggleCursor)

		-- Mappings defined in a keymap layer only apply when there are
		-- multiple cursors. This lets you have overlapping mappings.
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one.
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- Delete the main cursor.
			layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)

			-- Enable and clear cursors using escape.
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)

			layerSet("n", "<C-c>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		-- Customize how cursors look.
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
