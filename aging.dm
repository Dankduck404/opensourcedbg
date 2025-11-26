// aging.dm
// Called when mob is created
/mob/player/var/last_age_check = 0
/mob/player/var/age = 0

// Run this periodically (could be in Life() or a subsystem)
/mob/player/proc/CheckAge()
    if(world.time - last_age_check >= 18000) // 10 ticks = 1 second, 600 ticks = 1 minute, 30 minutes = 18000 ticks
        age += 1
        last_age_check = world.time
        src << "You have aged. Current age: [age]" // I will want to change this in the future where either it only flahses someone's column every year (You are [#] years old now)
        // or do it in the background and only highlight certain age phases (Baby, kid, teen, young adult(unprimed) and adult (primed)