// aging.dm
// Called when mob is created
/mob/player/var/last_age_check = 0
/mob/player/var/age = 0

// Run this periodically (could be in Life() or a subsystem)
/mob/player/proc/CheckAge()
    if(world.time - last_age_check >= 10) // 10 ticks = 1 second, 600 ticks = 1 minute, 30 minutes = 18000 ticks
        age += 1
        last_age_check = world.time
        src << "You have aged. Current age: [age]"