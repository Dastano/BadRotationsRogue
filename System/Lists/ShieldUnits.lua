if br.lists == nil then br.lists = {} end
-- Shield Units = shielding and levels, we should add coef as shield %
br.lists.shieldUnits = {
	-- Proving Grounds
	[71072] = { coef = -90, buff = 142427 }, -- Proving ground Sha shielded (will unshield later so better wait)
	[71064] = { coef = -100, buff = 142174, frontal = true }, -- when shielded and we are in front of unit, dont attack
	[71079] = { coef = -100, buff = 142174, frontal = true }, -- when shielded and we are in front of unit, dont attack
	-- Agatha Challenge Skin
	[115638] = { coef = -200, buff = 243027} -- Shadow Shield
}
