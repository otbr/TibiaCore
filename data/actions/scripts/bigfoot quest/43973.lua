function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and Game.isItemThere ({x = 32131, y = 31465, z = 3},2129) then
		item:transform(2773, 1)
		item:decay()
		Game.removeItemOnMap({x = 32131, y = 31465, z = 3},2129) 
		Game.createMonster("warlock", {x = 32119, y = 31468, z = 3})
	elseif item:getId() == 2773 then
		item:transform(2772, 1)
		item:decay()
	end
	return true
end