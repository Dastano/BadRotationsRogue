if br.lists == nil then br.lists = {} end
-- Crowd Control Units = list of units to stun, either always or udner certain condition such as having a buff or wirldwinding etc
br.lists.ccUnits = {
	-- Shadowmoon Burial Grounds
	[75966] = { name = "Defiled Spirit" }, -- need to be cc and snared and is not allowed to reach boss.
	[76446] = { name = "Shadowmoon Enslavers" },
	[75899] = { name = "Possessed Soul" }, -- only for melee i guess
	[79510] = { name = "Crackling Pyromaniacs" },
	-- Grimrail Depot
	[81236] = { name = "Grimrail Technicians", spell = 163966 }, -- channeling Activating
	[80937] = { name = "Gromkar Gunner" },
	-- UBRS
	[76157] = { name = "Black Iron Leadbelcher" }, -- Activates canon, should be when/if moving
	[76935] = { name = "Black Iron Drake-Keeper", fleeing = true }, -- Hhould be stunned/cc when running towards whelps
	-- Proving Ground
	[71415] = { name = "Banana Tosser(Small)", buff = 142639 },
	[71414] = { name = "Banana Tosser(Large)", buff = 142639 }
}
