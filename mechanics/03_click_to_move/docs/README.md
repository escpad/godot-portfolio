# [Click-to-Move] – Week [3] Dev-Log
![Demo](docs/click-to-move.gif)\
(With debug navigation off)\
![Demo](docs/click-to-move-debug.gif)\
(With debug navigation on)

## Goal
Move the player to a clicked location using NavigationAgent2D

Checklist:\
 [x] Setup nav region and tilemap\
 [x] Add NavigationAgent2D\
 [ ] Draw path from click to destination\
 [x] Walk path\
 [x] Arrival and idle state\
 [x] Add clicked location indicator\

## Implementation Highlights
- **NavigationAgent2D path-driven movement** – one line sets `agent.target_position`, letting Godot’s navigation handle A* and waypoint following.
- **Decoupled systems** – `_unhandled_input()` grabs the click once then `_physics_process()` moves the player every frame, which combats spamming issues.
- **Basic Particle Effect System system**  
  1. **Click flash**: one-shot `CPUParticles2D` spawned on left click.
  2. **Persistent marker**: instanced (or repositioned) on left click.
- **Sprite orientation function** – `_update_facing()` flips `AnimatedSprite2D.flip_h` using a ±1 pixel deadzone, avoiding jitter.
- **State-driven animations** – plays `walk` when navigating and reverts to `idle` upon stopping.

## What I Learned
- NavigationAgent2D makes it so theres less manual coding for navigation.
- Since I wanted to add some visuals, there are basic effects that uses the CPUParticles2D node, which I picked up on the fly.

## Time Spent
| Task                    | Hours |
|-------------------------|------:|
| NavMesh setup & pathing | 2.0 |
| Sprite flip + animations| 0.5 |
| Particle FX & cleanup   | 0.5 |
| README + GIF            | 0.5 |
| **Total**               | **3.5 h** |
