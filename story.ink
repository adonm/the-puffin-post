// The Puffin Post - A Seabird Adventure
// Main story file - start writing here!

VAR player_name = ""
VAR has_map = false
VAR fish_count = 0

-> introduction

=== introduction ===
The sun rises over Puffin Point, painting the sky in shades of pink and gold.

You are a young puffin, freshly fledged and ready for adventure. The rocky island stretches before you, full of mysteries to uncover and friends to meet.

* [What's your name, little puffin?]
    ~ player_name = "Pip"
    You're called {player_name}, named after the smallest and bravest of all puffins.
    -> the_nest
    
* [Let's begin the adventure]
    ~ player_name = "Feather"
    You're called {player_name}, with your distinctive white markings.
    -> the_nest

=== the_nest ===
Your nest sits high on the cliff, lined with soft grass and feathers. From here you can see the whole island.

{player_name}: "Today feels like an adventure day!"

+ [Look around the nest carefully] 
    Among the twigs, you find a small leather satchel - perfect for carrying treasures!
    ~ has_map = true
    You tuck the satchel under your wing.
    -> nest_examine
    
+ [Hop to the cliff edge]
    The wind ruffles your feathers. The view is breathtaking.
    -> cliff_edge
    
+ [Call out to your family]
    -> family_check

=== nest_examine ===
With your new satchel secured, you're ready to explore properly.

{has_map:
    You can pack any treasures you find today.
}

+ [Head to the cliff edge] -> cliff_edge
+ [Wait for inspiration] 
    Sometimes the best adventures start with patience...
    You spot a glint of something metallic near a rock.
    -> nest_examine

=== cliff_edge ===
The cliff drops sharply to the churning sea below. Gulls wheel overhead, and you can see several interesting places:

+ [The Tide Pools] -> tide_pools
+ [The Fishing Rocks] -> fishing_rocks
+ [The Old Lighthouse] -> lighthouse
+ [Return to your nest] -> the_nest

=== family_check ===
You puff up your chest and let out your best puffin call: "KARR-KARR-KARR!"

From nearby nests, you hear responses:
- Aunt Mabel's distinctive two-note whistle
- Your cousin's enthusiastic (if clumsy) squawk
- But no answer from Mum or Dad...

+ [Go find Mum and Dad] -> search_parents
+ [They must be fishing - I'll explore on my own] -> cliff_edge

=== search_parents ===
You hop from nest to nest, asking after your parents.

Aunt Mabel says: "They went to check on the fishing grounds at dawn, dear. Should be back soon."

+ [Wait at the nest for them] -> the_nest
+ [Go to the fishing rocks to surprise them] -> fishing_rocks

// Scene placeholders - add your content here!

=== tide_pools ===
The tide pools shimmer in the morning light, each one a tiny world of its own.

Starfish cling to rocks. Small fish dart between anemones. And there - a hermit crab is having an argument with a seagull over a shiny object!

+ [Help the hermit crab] -> help_crab
+ [Search for treasure in the pools] -> pool_search
+ [Go back up the cliff] -> cliff_edge

=== help_crab ===
You waddle over confidently. The seagull is twice your size, but you puff up your chest.

{player_name}: "Excuse me! That shiny object belongs to my friend here."

The seagull looks surprised, then amused.

Seagull: "And who might you be, little puffin?"

* ["I'm {player_name}, protector of the tide pools!"]
    The seagull laughs. "Well, {player_name}, you've got spirit. Here, take your friend's trinket."
    ~ fish_count = fish_count + 1
    The hermit crab scuttles away with his prize, but not before pressing a small silver coin into your claw.
    Hermit Crab: "For your help, brave puffin."
    -> tide_pools
    
* [Offer to trade]
    "I have... uh... this excellent piece of seaweed?"
    The seagull is not impressed and flies away with the shiny object.
    -> tide_pools

=== pool_search ===
You hop carefully from rock to rock, peering into each pool.

In the third pool, you find:
- A smooth blue stone that looks like the sea
- A tiny shell with a hole in it (perfect for a necklace!)
- And... what's this?

A bottle is wedged between two rocks, with something inside!

+ [Pull out the bottle] -> found_message
+ [Leave it - might be stuck] -> tide_pools

=== found_message ===
The bottle comes free with a pop!

Inside is a rolled piece of paper. You carefully extract it with your beak and unroll it.

The message reads:
"Meet me at the Old Lighthouse at sunset. Come alone. - C"

Who is C? And what do they want at the lighthouse?

+ [Head to the lighthouse immediately] -> lighthouse
+ [Go fishing first - you'll need energy] -> fishing_rocks
+ [Return to the nest to think] -> the_nest

=== fishing_rocks ===
The fishing rocks are crowded with adult puffins, all diving for silver fish. The air is full of excited calls and splashes.

{player_name}: "Time to catch some breakfast!"

You spot a flash of silver in the water below.

+ [Dive!] -> dive_attempt
+ [Wait for a bigger fish] -> fishing_rocks
+ [Look for Mum and Dad first] -> find_parents_rocks

=== dive_attempt ===
You tuck your wings and plunge!

The water is cold and shocking. You open your eyes underwater - everything is blue and shimmering.

There! A fish swims right past you. You snap your beak...

* [Got it!]
    ~ fish_count = fish_count + 1
    You surface triumphantly with a wriggling fish!
    -> fishing_success
    
* [Missed!]
    The fish darts away. You surface empty-beaked but determined.
    -> fishing_rocks

=== fishing_success ===
The fish is delicious! You feel energized and ready for adventure.

{fish_count > 1:
    You've caught {fish_count} fish now. You're becoming quite the fisher-puffin!
}

+ [Catch another] -> dive_attempt
+ [Rest on the rocks] -> rest_on_rocks
+ [Go explore elsewhere] -> cliff_edge

=== rest_on_rocks ===
You find a sunny spot and settle in. The warmth feels wonderful on your feathers.

From here you can see:
- The lighthouse standing tall in the distance
- Your cliff home high above
- Ships passing on the horizon

A small crab scuttles by with a message clutched in its claw...

+ [Follow the crab] -> follow_crab
+ [Watch the ships] -> watch_ships
+ [Time to move on] -> cliff_edge

=== find_parents_rocks ===
You search the fishing puffins, but Mum and Dad aren't here.

Uncle Finn sees you looking around.

Uncle Finn: "Your parents? Oh, they were heading to check on the lighthouse keeper this morning. Old Salt hasn't been seen in a few days."

+ [Go to the lighthouse to find them] -> lighthouse
+ [Keep fishing] -> fishing_rocks

=== lighthouse ===
# IMAGE: lighthouse.jpg

The Old Lighthouse stands at the island's edge, its white paint peeling but its light still proud. The door hangs slightly open.

You can hear voices inside...

Mum's voice: "...worried about you, Old Salt."
Dad's voice: "The supply boat comes tomorrow. You can't keep avoiding people."

+ [Knock politely] -> enter_lighthouse
+ [Peek through the window first] -> peek_lighthouse
+ [Wait outside] -> wait_outside

=== enter_lighthouse ===
You tap your beak against the door frame.

Mum and Dad turn around, surprised but pleased.

Mum: "{player_name}! What are you doing all the way out here?"

* ["Looking for you! Aunt Mabel was worried."]
    Dad: "Always the responsible one, aren't you? We're just checking on Old Salt."
    -> meet_old_salt
    
* ["I found a mysterious message!"]
    You show them the bottle message.
    Dad raises an eyebrow. "'Meet at sunset, come alone'... Sounds suspicious."
    Mum: "We're coming with you."
    -> lighthouse_mystery

=== meet_old_salt ===
From the shadows emerges the oldest puffin you've ever seen. His feathers are grey-white, and one eye is clouded with age.

Old Salt: "So this is the young one I've heard about. The adventurer."

He studies you carefully.

Old Salt: "Tell me, {player_name}, what brings you to my lighthouse?"

+ ["I want to hear your stories"]
    Old Salt smiles, showing his worn beak.
    "Stories, eh? I have plenty of those..."
    -> old_salt_stories
    
+ ["I'm looking for adventure"]
    "Adventure finds those who seek it, young one. But be careful what you wish for."
    He glances at your parents, then back to you.
    "There's something I need help with..."
    -> lighthouse_quest

// More scenes to add!

=== old_salt_stories ===
Old Salt settles onto his perch, eyes distant with memory.

"Did I ever tell you about the Great Storm of '87? The waves were taller than the lighthouse itself!"

He weaves tales of:
- Shipwrecks and rescues
- Hidden treasure caves
- The legendary Rainbow Fish

You listen, fascinated, as the afternoon slips by...

-> END

=== lighthouse_quest ===
Old Salt rummages in a chest and pulls out an old, water-stained map.

"This shows the location of the Cormorant's Cache - a secret store of supplies hidden by my grandfather during the war. But I can't read it anymore, and I need those supplies before winter."

He looks at you with hope in his cloudy eyes.

"Will you help an old puffin?"

+ ["I'll find the cache!"]
    He presses the map into your wing.
    "Be careful, young one. And take this - you'll need it."
    He gives you an old brass compass.
    -> treasure_hunt
    
+ ["I should ask my parents first"]
    Mum: "It's a big responsibility, but we trust you."
    Dad: "We'll be right behind you if you need help."
    -> treasure_hunt

=== treasure_hunt ===
With the map in hand (or wing), you're ready to find the Cormorant's Cache!

According to the map:
- Start at the Twin Rocks
- Follow the setting sun
- Look for the door in the cliff

Your adventure is just beginning...

-> END

// Placeholder scenes - expand these or add new ones!

=== family_check ===
This is a placeholder - content coming soon!
-> END

=== nest_examine ===
This is a placeholder - content coming soon!
-> END

=== family_check ===
This is a placeholder - content coming soon!
-> END

=== watch_ships ===
This is a placeholder - content coming soon!
-> END

=== follow_crab ===
This is a placeholder - content coming soon!
-> END

=== peek_lighthouse ===
This is a placeholder - content coming soon!
-> END

=== wait_outside ===
This is a placeholder - content coming soon!
-> END

=== lighthouse_mystery ===
This is a placeholder - content coming soon!
-> END
