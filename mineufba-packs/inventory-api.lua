local inv_func = {}

inv_func.find_item_on_inventory = function (player, item)
    
    -- Item is the item name (string)

    local inv = player:get_inventory()
    local list = inv:get_list("main")
    local size = inv:get_size("main")

    local foundIndex = -1
    
    for i,stack in pairs(inv:get_list("main")) do

        if (not stack:is_empty() and stack:get_name() == item) then

            foundIndex = i
            break

        end
    end

    return foundIndex

end