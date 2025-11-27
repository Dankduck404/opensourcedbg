/mob/player
    var/race = "None" // Default unless changed._dm_db_close(db_query)
    var/race_chosen = 0 // Flag for players that already picked a character._dm_db_close(db_query)


    proc/ApplyRaceBonuses()
        if(race_chosen)
            return

        switch(race)
            if("Human")
                strength += 1
                endurance += 1
                speed += 1
                resistance += 1
                force += 1
                offense += 1
                defense += 1
                recovery += 1
                regeneration += 1
                src << "Your race is: [race]"

            if("Beastman")
                endurance += 2
                regeneration += 2
                strength += 2
                src << "Your race is: [race]"

            if("Elf")
                endurance -= 1
                strength -= 1
                speed += 1
                force += 1
                defense += 2
                src << "Your race is: [race]"
    
    race_chosen = 1 // this will mark the flag

/mob/player/proc/RaceSelect()
    var/choice = input(src, "Choose your race:", "Race Select") in list("Human", "Beastman", "Elf")
    race = choice
    ApplyRaceBonuses()
    src << "You picked [race] race."