# IGDA NJIT Plug n' Play 2025
This is the official repository for the IGDA NJIT chapter's Plug n' Play Jam.

The goal of this jam is for members to create their own levels with their own unique mechanics using a project base provided in this GitHub repository.

The project base is made in Godot, so participants in the jam must use the Godot engine to create their custom levels.

The final, finished project will be a compilation of all of the submitted levels into one finished and publishable game.

## How to Clone
The base code you will be modifying can be found in the `base` branch of this repository. Be sure to clone that branch using the command:
```
git clone -b base --single-branch https://github.com/IGDA-NJIT-eboard/plug-n-play-f24.git
```
Every script file and packed scene in this project is fully documented to make modifying this project as simple as possible

## How to Use This Codebase

The base repository includes a sample platformer level + minimal platformer template which was provided as a base for previous iterations of this jam. The `DONOTEDITME` folder includes some basic building blocks you can use to build up a platformer style level. We would like to emphasize that you **do not** need to use these sample scenes or tools at all to create a level. You are free to experiment and branch out and create any sort of level you'd like (3D levels are also perfectly valid).

The base repository also has a template README.md that you must fill out with all relevant information for me to be able to add your level to the final product.

### DO NOT EDIT THE `DONOTEDITME` FOLDER
All of your code and scenes must exist in the `dev` folder. If you would like to extend functionality we've provided to you, your extended scenes/code must exist entirely within your `dev` folder. When your level is merged into the main project, we will essentially copy the `dev` folder into the main project.

This game will be designed with controller in mind. DO NOT change the provided project's Input Map and I would strongly advise against including mechanics that require a Mouse.

In order for your level to be valid and included in the main game
1. The root node of your level must have the `level.gd` script. You do not need to provide BGM or a level ID.
2. Your level must have the PauseMenu scene
Other than that you are free to go wild

The following APIs have been provided for you to interface with the game base (By API I mean you can refer to these objects freely in code)
1. The `level_loader` object has the functions `reload_level` and `end_level` for reloading and winning the level respectively
2. The `sound_player` object has the `play_sound_2d` and `play_sound_3d` function for playing 2D/3D spatial sound effects respectively, as well as the `change_music` function for changing the background music

## Credits

TBA
