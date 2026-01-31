# The Puffin Post

An interactive fiction adventure game built with Ink.

## Project Structure

```
the-puffin-post/
├── story.ink          # Main story file (start here)
├── scenes/            # Additional scene files
│   └── (your chapters here)
├── index.html         # Compiled game (auto-generated)
└── README.md          # This file
```

## Getting Started

### Prerequisites

Install [mise](https://mise.jdx.dev/) for tool management:
```bash
brew install mise        # macOS with Homebrew
mise install             # Install all tools (node, python, inklecate)
```

### Development Commands

- `mise run build` - Compile Ink files to JSON
- `mise run dev` - Watch files and serve locally (http://localhost:8000)
- `mise run serve` - Start local server only
- `mise run check` - Validate Ink syntax
- `mise run clean` - Remove generated files

### Manual Workflow (No Mise)

1. **Download Inky** (the Ink editor): https://www.inklestudios.com/ink/
2. **Open `story.ink`** in Inky
3. **Write your story** - see the examples in story.ink to learn the syntax
4. **Export to web**: File → Export for Web → choose your project folder

## Writing Your Story

Ink uses simple markup:

```ink
=== the_beach ===
You stand on a rocky beach. Seagulls cry overhead.

+ [Explore the caves] -> dark_cave
+ [Climb the cliff] -> cliff_top
+ [Sit and watch the waves] -> beach_relax

=== dark_cave ===
The cave is damp and mysterious...
```

### Key Features

- **Choices**: Start lines with `+` for player options
- **Diverts**: Use `-> destination` to move between scenes
- **Variables**: Track state with `VAR gold = 0`
- **Conditionals**: Show options only if conditions are met with `{condition}`

## Kids' Collaboration Tips

Each person can work on different scene files:
- Add a new `.ink` file in the `scenes/` folder
- Include it in the main story with `-> scene_name`
- Use git to track changes and merge work

Example git workflow:
```bash
git pull                    # Get latest changes
git add scenes/my-scene.ink # Add your work
git commit -m "Added forest scene"
git push                    # Share with others
```

## Deployment

This project is configured to automatically deploy to GitHub Pages when you push changes to the main branch.

1. Export your story from Inky to `index.html`
2. Commit and push: `git add index.html && git commit -m "Update game" && git push`
3. Visit: https://adonm.github.io/the-puffin-post/

## Story Ideas

- **The Missing Egg**: A puffin's egg has been stolen! Track clues across the island.
- **Storm's Coming**: Gather supplies and help your puffin family prepare for a big storm.
- **The Secret Message**: Find bottles with messages and uncover a mystery.
- **First Flight**: Help a young puffin learn to fly and explore the island.

Happy storytelling!
