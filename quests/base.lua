minetest.register_chatcommand("quests", {
	params = "",
	description = "Shows your quests",
	privs = {},
	func = function(name, text)
		minetest.show_formspec(name, "quests:show_quests", quests.get_formspec(name))
		return true, ""
	end,
})
