# 2D Endless Runner

A simple 2D endless runner game built with Godot 4.5.

## How to Play

- Press **SPACE**, **UP ARROW**, or **LEFT CLICK** to jump
- Avoid the red obstacles
- Survive as long as possible to get a high score
- The game gets progressively faster and more difficult

## Features

- Smooth player jump mechanics with gravity
- Infinite scrolling ground system
- Dynamic obstacle spawning with increasing difficulty
- Parallax background with multiple layers for depth
- Score tracking system
- Game over screen with restart functionality
- Progressive difficulty - speed increases every 100 points

## Game Structure

### Scenes
- `scenes/main.tscn` - Main game scene with all components
- `scenes/player.tscn` - Player character (blue square)
- `scenes/ground.tscn` - Ground tile (brown rectangle)
- `scenes/obstacle.tscn` - Obstacle (red rectangle)
- `scenes/parallax_background.tscn` - Layered background

### Scripts
- `scripts/game_manager.gd` - Main game logic, scoring, and game states
- `scripts/player.gd` - Player movement and jump mechanics
- `scripts/ground_spawner.gd` - Infinite ground tile generation
- `scripts/obstacle_spawner.gd` - Random obstacle spawning
- `scripts/parallax_controller.gd` - Background scrolling

## Running the Game

1. Open the project in Godot 4.5 or later
2. Press F5 or click the Play button
3. Enjoy!

## Customization Ideas

- Replace colored rectangles with sprite artwork
- Add different obstacle types
- Implement collectible items (coins, power-ups)
- Add sound effects and music
- Create different environment themes
- Add mobile touch controls
- Implement a leaderboard system
