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

 // continue this - use your ai tool for it's history

/mob/player/verb/NewGame()
	set hidden = 1
	src << "Starting a new game..."
	winshow(src, "window2", 0)
	winshow(src, "window1", 1) //For test_beserkskin.dmf
	// when you get time tomorrow, get help with throwing in the olddbg_dmf windows into the game like putting on the skin etc

	RaceSelect()

/mob/player/verb/LoadGame()
	set hidden = 1
	src << "Loading saved game..."
	// LoadCharacter()

/mob/player/verb/ChooseRace(r as text)
	set hidden = 1

	if(race_chosen)
		src << "You have already chosen your race([race])."
		return


	src.race = r
	ApplyRaceBonuses()

	winshow(src, "window1", 0) // windows 1 is the race selection screen while 2 is the main menu lmao
	// PointSelection()

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

/mob/player/verb/Say(msg as text)
	for(var/mob/M in oview(src))
	usr << "[src.name] says: [msg]"

/mob/player/proc/Str_up()
	strength += 1 // Add in inventory system (where KGs will tell how heavy a player can lift/carry)

/mob/player/Stat()
	..()
	CheckAge()

	stat("Race:", race)
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
