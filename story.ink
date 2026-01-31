// The Puffin Post - A Seabird Adventure
// Main story file - start writing here!

VAR player_name = ""
VAR has_map = false
VAR fish_count = 0
VAR bravery_points = 0
VAR is_scared = false

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
+ [Dark Cave in the cliff face] -> dark_cave
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

=== watch_ships ===
You settle in to watch the ships pass on the horizon. The sun is warm, the breeze gentle. It's peaceful.

Too peaceful.

A sudden chill makes you shiver. The wind has changed direction, carrying a faint... crying sound?

You look around. The other puffins have gone. The rocks are empty. You're alone.

The crying grows louder—a mournful wailing that seems to come from the sea itself. Then you see it: a ship on the horizon, but wrong somehow. It looks... old. Ancient. Its sails are tattered, hanging like ghostly rags.

*The Ghost Ship*, Old Salt's stories whisper in your memory. *The one that sank fifty years ago, taking all hands with it...*

The ship isn't moving with the wind. It's moving against it. Toward the island. Toward YOU.

Your feathers freeze. You can't move. The wailing grows louder, and now you can hear voices—dozens of voices calling your name...

"{player_name}... {player_name}... join us..."

+ [Run!]
    ~ is_scared = true
    You scramble up the rocks, wings flapping uselessly, heart hammering. You don't stop until you're back in your nest, buried under a pile of soft grass, trembling.
    
    It takes hours for your heart to slow. When you finally peek out... the ship is gone. Just a normal evening. Maybe it was just a trick of the light?
    -> END
    
+ [Hide and watch]
    ~ bravery_points = bravery_points + 1
    You force yourself to stay still, tucked behind a rock. The ghost ship grows closer... closer...
    
    Then you notice something. The "sails" are catching the sunset at a strange angle. They're not ragged at all—they're just regular sails, illuminated by the golden light. And the "wailing"? Just wind through the rigging of a cargo ship carrying metal pipes.
    
    You laugh at your own imagination. But you watch until it passes, just to be sure.
    -> cliff_edge
    
+ [Call back to the voices]
    ~ bravery_points = bravery_points + 2
    "Hello!" you shout. "I'm {player_name}! Who are you?"
    
    The voices stop. There's a long pause. Then—laughter. Familiar laughter!
    
    "Got you!" your cousin calls out from behind a rock, holding a conch shell. The "ghost ship" is just the fishing trawler with its nets deployed.
    
    "You should see your face!" your cousin cackles.
    
    You chase them around the rocks, laughing despite your racing heart. "I'll get you back for this!"
    -> cliff_edge

=== dark_cave ===
A narrow opening in the cliff reveals a passage leading down into darkness. Cold air breathes from within, carrying the scent of salt and something... ancient.

You venture inside. The light from the entrance fades quickly. Soon you're feeling your way along wet stone walls, your own breathing loud in your ears.

*Drip... drip... drip...*

Water falls somewhere in the darkness. The sound echoes strangely—almost like footsteps following you.

You stop. The dripping stops too.

You walk. The dripping resumes.

*Drip... drip... drip...*

Matching your pace perfectly.

Your feathers bristle. Is something following you? Something that stops when you stop?

Then you see it—a faint glow ahead. Blue-green light pulsing softly. As you approach, the cave opens into a cathedral of stone.

Stalactites hang like monster teeth. The walls glitter with glowing fungus, casting twisted shadows that seem to move on their own.

And in the center, on a stone pedestal...

A skull.

A bird skull, picked clean by time, staring at you with empty eye sockets.

*Welcome...* something whispers.

+ [Scream and run!]
    ~ is_scared = true
    You don't think. You just RUN. Wings flapping, feet scrambling on stone, you bolt for the entrance as fast as you can go.
    
    Behind you, the whisper seems to follow: *Wait... come back...*
    
    You burst into daylight, gasping, and don't stop running until you're back at your nest. Whatever is in that cave... it can stay there.
    -> END

+ [Approach the skull carefully]
    ~ bravery_points = bravery_points + 1
    "H-hello?" you stammer.
    
    The whisper comes again: *Welcome... to the Hall of Echoes...*
    
    You edge closer. The skull is just bone, old and brittle. But behind it, you notice something—a mechanism. A lever made of driftwood.
    
    You pull it.
    
    *CLICK*
    
    A section of wall grinds open, revealing a hidden chamber filled with... books! Old Salt's lost library! The "skull" is just a decoration, and the "whisper" is wind through cleverly placed holes in the stone.
    
    You've discovered Old Salt's secret study!
    -> treasure_hunt

+ [Talk to the skull]
    ~ bravery_points = bravery_points + 2
    "Nice cave you've got here," you say, trying to sound casual despite your shaking voice. "Very... atmospheric."
    
    The whisper chuckles. *Brave little puffin. Few speak to the Guardian of the Deep.*
    
    "I'm {player_name}. What's your name?"
    
    A long pause. Then: *I... I don't remember. It's been so long...*
    
    You step closer. The skull isn't magical—it's just old. But behind it, you find a metal name tag on a chain: "CAPTAIN BLACKBEAK, 1876."
    
    "Captain Blackbeak," you read aloud. "I found your name."
    
    The wind through the holes sounds almost... grateful.
    
    As you explore the chamber, you realize this was Blackbeak's final resting place. You say a little prayer for the old pirate bird, then search his belongings. You find an old compass and a note about buried treasure.
    
    "Thank you, Captain," you whisper.
    
    The wind whispers back: *Safe travels, brave one...*
    -> treasure_hunt

=== follow_crab ===
You hop after the crab, curiosity getting the better of you. It scuttles across the rocks toward a dark crevice in the cliff face—a narrow crack you never noticed before.

The crab disappears inside. You hesitate at the entrance. It's pitch black in there, and cold air breathes out like the cliff itself is sighing.

But you've come this far. You squeeze through.

Darkness envelops you. You can barely see your own feet. The only sound is the click-click-click of the crab's claws ahead and the distant drip... drip... drip of water.

*Hello...*

You freeze. Was that a voice? It seemed to come from everywhere at once, echoing off the stone walls.

*Hello... hello... hello...*

The echo makes your feathers bristle. The crab has stopped. It's waiting, claws raised, looking at something ahead.

A faint blue glow appears in the distance, pulsing slowly like a heartbeat.

+ [Turn back!]
    ~ is_scared = true
    This is too creepy. You back out of the tunnel as fast as your wings can carry you, not stopping until you're back in the sunlight.
    
    The crab follows you out, looking disappointed. It drops the message at your feet and scuttles away.
    
    The message just says: "Follow the light."
    -> rest_on_rocks
    
+ [Keep following the crab]
    ~ bravery_points = bravery_points + 1
    You take a deep breath and waddle forward. The blue glow grows brighter as you approach.
    
    The tunnel opens into a small cavern. The walls are covered in glowing blue mushrooms! They pulse gently, lighting up the whole space.
    
    "Beautiful..." you whisper.
    
    *Beautiful... beautiful... beautiful...*
    
    The echo makes you jump, then laugh. It was just your own voice bouncing off the walls!
    
    The crab taps a stone, revealing a hidden compartment with an old journal inside. It's Old Salt's research notes about the bioluminescent fungi.
    
    You tuck it in your satchel to return to him.
    -> treasure_hunt
    
+ [Call out to the voice]
    ~ bravery_points = bravery_points + 2
    "Who's there?" you call into the darkness.
    
    *Who's there... who's there... who's there...*
    
    The echo mocks you. But then—another sound. Flapping wings!
    
    "{player_name}? What are you doing in here?"
    
    It's Aunt Mabel! She was collecting mushrooms for her evening stew.
    
    "These caves can be confusing," she says, lighting her way with a glowing mushroom. "Let me show you the way out."
    
    She leads you through a shortcut that brings you right to the lighthouse!
    -> lighthouse

=== peek_lighthouse ===
You press your face against the cold glass of the lighthouse window. The room inside is dark... too dark.

Suddenly—

*SCRAPE*

A sound from upstairs makes you jump! Your feathers puff up in alarm.

Through the gloom, you see shadows moving on the wall. Long, twisted shadows that stretch and reach like fingers. They seem to be coming from the spiral staircase.

*CREEEAK...*

The sound of footsteps on old wood. Slow. Deliberate. Coming down the stairs.

A flickering light appears at the top of the staircase—a ghostly blue glow that shouldn't be there. The lighthouse lamp hasn't worked in years...

{player_name}'s heart pounds. 

+ [Run away!]
    ~ is_scared = true
    You back away from the window, wings trembling. Whatever is in there... you don't want to meet it.
    -> cliff_edge
    
+ [Knock on the window]
    ~ bravery_points = bravery_points + 1
    You tap the glass with your beak. "Hello?"
    
    The shadows freeze. The footsteps stop. Then—
    
    "{player_name}? Is that you?"
    
    It's Mum's voice! Relief washes over you as the shadows resolve into normal shapes. Mum appears at the window, holding an old lantern.
    
    "You gave us quite a scare, peeking in like that! Come inside, dear."
    -> enter_lighthouse
    
+ [Watch longer]
    You stay perfectly still, barely breathing.
    
    The blue light flickers and moves down the stairs. The shadows dance across the walls. You can make out two distinct shapes now, moving together.
    
    Then you hear it—familiar voices. Mum and Dad! They're carrying something that glows with that strange blue light.
    
    "Bioluminescent algae," Dad is saying. "Old Salt's been collecting it for his studies."
    
    You let out a breath you didn't know you were holding. Just your parents, not ghosts at all!
    -> enter_lighthouse

=== wait_outside ===
You settle onto a rock outside the lighthouse to wait. The sun is beginning to set, painting the sky in deep oranges and purples.

But as the light fades, something changes. A thick fog rolls in from the sea, silent and cold. It swirls around your feet, then your wings, then your beak.

Soon, you can barely see your own claws.

*WHOOOOOSH*

The wind picks up, making strange whistling sounds through the lighthouse's broken windows. It almost sounds like... voices? Whispering voices, too quiet to understand.

Then—

*Pitter-patter... pitter-patter...*

Footsteps! Small, quick footsteps circling around you in the fog. Something is out there, watching you. You can feel eyes on your back.

Two glowing spots appear in the fog, about eye-level. They blink slowly. Yellow. Predatory.

Your feathers stand on end. 

+ [Call for help!]
    ~ bravery_points = bravery_points + 1
    "MUM! DAD!" you cry out.
    
    The lighthouse door bursts open. "{player_name}!"
    
    The glowing eyes vanish instantly. As the fog clears slightly, you see it was just... Old Salt's cat, Midnight, out for an evening prowl.
    
    Dad scoops you up. "Brave little puffin, calling for help. Come inside, it's getting dark."
    -> enter_lighthouse
    
+ [Hide behind the rock]
    ~ is_scared = true
    You scramble behind the rock, heart hammering. The footsteps circle closer... closer...
    
    Then a rough tongue licks your wing!
    
    You squawk and tumble backward—right into Dad's wings.
    
    "Easy there, {player_name}," Dad laughs. "It's just Midnight, Old Salt's cat."
    
    The black cat purrs and rubs against your leg. Those scary glowing eyes were just reflecting the sunset!
    -> enter_lighthouse
    
+ [Face whatever it is]
    ~ bravery_points = bravery_points + 2
    You puff up your chest and step forward. "Show yourself!"
    
    The fog parts—and a skinny black cat walks out, meowing pitifully. It's shivering in the cold.
    
    "Oh, you poor thing," you say, all fear forgotten. You nudge the cat toward the lighthouse door with your beak.
    
    Dad opens the door and laughs. "Well, well, {player_name} the Brave, protector of lost cats! That's Midnight. Come inside, both of you."
    -> enter_lighthouse

=== lighthouse_mystery ===
The sun touches the horizon, painting everything in shades of gold and purple. You, Mum, and Dad wait near the lighthouse, watching for whoever "C" might be.

*CRACK!*

A branch snaps in the bushes nearby. All three of you whirl around.

"Show yourself!" Dad calls out, trying to sound brave.

Silence. Then... footsteps. Heavy, slow footsteps crunching on gravel.

A massive shape detaches itself from the shadows. It towers over you—twice your height, with broad wings and a sharp beak silhouetted against the sunset.

It's the biggest bird you've ever seen.

"C..." the figure says in a deep, rumbling voice. "Come alone, the message said. Yet you bring... company."

Your feathers stand on end. This is terrifying! The creature steps closer, and you can see it has something in its claws. Something sharp and metal...

"Stay back!" Mum warns, spreading her wings protectively.

The figure stops. Then...

It laughs. A warm, grandmotherly laugh.

"Oh my! Did I scare you little puffins? I'm so sorry!"

She steps into the fading light. She's a magnificent old cormorant with silver-tipped feathers, holding a metal tea strainer.

"I'm Coral," she says with a bow. "Old Salt's sister. I wanted to surprise him with tea and biscuits, but I couldn't find the lighthouse in this fog!"

Dad deflates with relief. "You nearly gave us heart attacks, Coral!"

"The dramatic entrance wasn't intentional, I promise!" She chuckles. "Though I must say, {player_name}, you stood your ground admirably. Very brave."

~ bravery_points = bravery_points + 1

+ [Ask about the mysterious message]
    "Why the secret message, then?"
    
    Coral looks sheepish. "I found that bottle on the beach weeks ago. I thought it would be funny to send a mysterious note to my brother. I didn't know a young puffin would find it!"
    
    She ruffles your feathers affectionately. "But I'm glad you did. Brave enough to follow a mystery, smart enough to bring help. Old Salt will want to meet you."
    -> meet_old_salt

+ [Accept her apology]
    "You really did scare me," you admit.
    
    "I'm truly sorry, little one," Coral says sincerely. "Let me make it up to you with some of my famous seaweed biscuits?"
    
    The promise of biscuits makes everything better. You follow her into the lighthouse, where Old Salt is waiting with hot tea and stories.
    -> old_salt_stories

+ [Stay cautious]
    You eye her suspiciously. "How do we know you're really Old Salt's sister?"
    
    Coral smiles and pulls out a locket. Inside is a faded photo of two young birds—young Salt and young Coral, standing in front of this very lighthouse.
    
    "We built this place together," she says softly. "Before the war. Before... everything."
    
    The sadness in her voice is real. You believe her.
    -> meet_old_salt
