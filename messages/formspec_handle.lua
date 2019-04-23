formspec = {}

function formspec.show_message (name, text, continue)

	continue = continue or false

	local closeTxt

	if (continue) then

		closeTxt = "Continue"

	else

		closeTxt = "Close"
	end

	minetest.after(0.5, function (name, closeTxt)
		minetest.show_formspec(name, name .. ":form",
	                "size[12,6]"..
					"tablecolumns[text]"..
					"tableoptions[background=#000000;highlight=#000000;border=false]"..
					"table[0,0.25;12,5.2;infosign_text;".. text ..
					"]"..
					"button_exit[4.5,5.5;3,1;quit;".. closeTxt .."]")
	end, name, closeTxt)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    
	local name = player:get_player_name() 

    if (formname ~= name .. ":form" or not fields.quit) then return false end

	messages.players[name].busy = false

    return true
end)