/datum/spell/aoe_turf/conjure/summon
	var/name_summon = 0
	cast_sound = 'sound/effects/weapons/energy/wave.ogg'

/datum/spell/aoe_turf/conjure/summon/before_cast()
	..()
	if(name_summon)
		var/newName = sanitize(input("Would you like to name your summon?") as null|text, MAX_NAME_LEN)
		if(newName)
			newVars["name"] = newName

/datum/spell/aoe_turf/conjure/summon/conjure_animation(atom/movable/fake_overlay/animation, turf/target)
	animation.icon_state = "shield2"
	flick("shield2",animation)
	sleep(10)
	..()


/datum/spell/aoe_turf/conjure/summon/bats
	name = "Summon Space Bats"
	desc = "This spell summons a flock of spooky space bats."
	feedback = "SB"

	charge_max = 1200 //2 minutes
	spell_flags = NEEDSCLOTHES
	invocation = "Bla'yo daya!"
	invocation_type = SPI_SHOUT
	level_max = list(SP_TOTAL = 3, SP_SPEED = 2, SP_POWER = 3)
	cooldown_min = 600

	range = 1

	summon_amt = 1
	summon_type = list(/mob/living/simple_animal/hostile/scarybat)

	icon_state = "wiz_bats"

/datum/spell/aoe_turf/conjure/summon/bats/empower_spell()
	if(!..())
		return 0

	newVars = list("maxHealth" = 20 + spell_levels[SP_POWER]*10, "health" = 20 + spell_levels[SP_POWER]*10, "melee_damage_lower" = 10 + spell_levels[SP_POWER]*3, "melee_damage_upper" = 10 + spell_levels[SP_POWER]*5)

	return "Your bats are now stronger."

/datum/spell/aoe_turf/conjure/summon/bear
	name = "Summon Bear"
	desc = "This spell summons a permanent bear companion that will follow your orders."
	feedback = "BR"
	charge_max = 3000 //5 minutes because this is a REALLY powerful spell. May tone it down/up.
	spell_flags = NEEDSCLOTHES
	invocation = "REA'YO GOR DAYA!"
	invocation_type = SPI_SHOUT
	level_max = list(SP_TOTAL = 4, SP_SPEED = 0, SP_POWER = 4)

	range = 0

	name_summon = 1

	summon_amt = 1
	summon_type = list(/mob/living/simple_animal/hostile/commanded/bear)
	newVars = list("maxHealth" = 100,
				"health" = 100,
				"melee_damage_lower" = 20,
				"melee_damage_upper" = 20,
				)

	icon_state = "wiz_bear"

/datum/spell/aoe_turf/conjure/summon/bear/New()
	. = ..()

/datum/spell/aoe_turf/conjure/summon/bear/before_cast()
	..()
	newVars["master"] = holder //why not do this in the beginning? MIND SWITCHING.

/datum/spell/aoe_turf/conjure/summon/bear/empower_spell()
	if(!..())
		return 0
	switch(spell_levels[SP_POWER])
		if(1)
			newVars = list("maxHealth" = 150,
						"health" = 150,
						"melee_damage_lower" = 20,
						"melee_damage_upper" = 25
						)
			return "Your bear has been upgraded from a cub to a whelp."
		if(2)
			newVars = list("maxHealth" = 200,
						"health" = 200,
						"melee_damage_lower" = 30,
						"melee_damage_upper" = 30
						)
			return "Your bear has been upgraded from a whelp to an adult."
		if(3)
			newVars = list("maxHealth" = 250,
						"health" = 250,
						"melee_damage_lower" = 45,
						"melee_damage_upper" = 45
						)
			return "Your bear has been upgraded from an adult to an alpha."
		if(4)
			newVars = list("maxHealth" = 300,
						"health" = 300,
						"melee_damage_lower" = 55,
						"melee_damage_upper" = 55,
						"resistance" = 10
						)
			return "Your bear is now worshiped as a god amongst bears."

/datum/spell/aoe_turf/conjure/summon/bear/spell_learned(mob/user)
	if(!user || !user.mind)
		return

	to_chat(user, "A short note regarding the available commands for your bear has been placed in your notes.")
	var/bear_guide = {"<br/><b>Congratulations, you now can summon a magic, bluespace bear.</b><br/>
						The bear's mind is dominated, so it should not attack you under any circumstances. You can command your bear through words, but remember that it must hear you.<br/>
						<b> Your bear knows the following commands:</b><br/>
						- stay<br/>
						- stop: your bear will stop following all previous commands.<br/>
						- attack: designate someone (or everyone!) as a threat. <br/>
						- follow: your bear will follow anyone designated, for example say 'Bear follow me'.<br/>
						-  dance: it will literally dance.<br/>
						- add friend: your bear won't attack those who are designated as a friend.<br/>
						- remove friend: use to cancel previous command.<br/>
						Simply pronounce your bear name when issuing a command. Remember to address your bear by name or else it will not heed the command.<br/>"}

	user.mind.store_memory(bear_guide)
