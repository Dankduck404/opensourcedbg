/mob/player
	icon = 'humans.dmi'
	var/strength = 1
	var/endurance = 1
	var/speed = 1
	var/resistance = 1
	var/force = 1
	var/offense = 1
	var/defense = 1
	var/recovery = 1
	var/regeneration = 1

/mob/player/verb/who()
	set category = "Player"
	set name = "Who"

	var/PlayerCount
	usr << "-- Players Online --" // List title
	for (var/mob/M in world)
	// for(var/client/C in client)
		if(M.client) //
			PlayerCount ++
			usr << M.key
		usr << "-[PlayerCount]Players"
		world.status = "((-[PlayerCount] Players Online.))"
	usr << "-- End of List --"


/mob/player/proc/Str_up()
	strength += 1 // Add in inventory system (where KGs will tell how heavy a player can lift/carry)

/mob/player/Stat()
	..()
	CheckAge()

	stat("strength", strength)
	stat("endurance", endurance)
	stat("speed", speed)
	stat("resistance", resistance)
	stat("force", force)
	stat("offense", offense)
	stat("defense", defense)
	stat("recovery", recovery)
	stat("regeneration", regeneration)
	stat("Age:", age)

/*	strength = 1
	endurance = 1
	speed = 1
	resistance = 1
	force = 1
	offense = 1
	defense = 1
	recovery = 1
	regeneration = 1 */
