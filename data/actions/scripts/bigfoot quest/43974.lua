function onUse(player, item, fromPosition, target, toPosition)
	if item:getId() == 2772 and Game.isItemThere ({x = 32123, y = 31460, z = 3},2129) then
		item:transform(2773, 1)
		item:decay()
		Game.removeItemOnMap({x = 32123, y = 31460, z = 3},2129) 
		Game.createMonster("warlock", {x = 32127, y = 31468, z = 3})
	elseif item:getId() == 2773 then
		item:transform(2772, 1)
		item:decay()
	end
	return true
end