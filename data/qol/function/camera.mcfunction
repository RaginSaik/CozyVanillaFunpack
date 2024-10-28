scoreboard players enable @a cameraon
scoreboard players enable @a cameraoff
#make everyone who triggered cameraon spectator and reset trigger
execute as @a[scores={cameraon=1}] run gamemode spectator @s
execute as @a[scores={cameraon=1}] run scoreboard players add playersincam cameracounter 1
execute as @a[scores={cameraon=1}] run scoreboard players operation @s cameratp = playersincam cameracounter
execute at @a[scores={cameraon=1}] run summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Invisible:1b,Tags:["camtemp","camera"]}
scoreboard players operation @e[type=armor_stand,tag=camtemp,tag=camera] cameratp = playersincam cameracounter
tag @e[type=armor_stand,tag=camtemp,tag=camera] remove camtemp
execute as @a[scores={cameraon=1}] run scoreboard players add @s cameraon 1
#make everyone who triggered cameraoff survival
execute as @e[type=armor_stand,tag=camera] if score @s cameratp = @a[scores={cameraoff=1},limit=1] cameratp run tag @s add valid_tp_target
execute as @a[scores={cameraoff=1}] run tp @s @e[type=armor_stand,tag=camera,tag=valid_tp_target,limit=1]
execute as @a[scores={cameraoff=1}] run kill @e[type=armor_stand,tag=camera,tag=valid_tp_target]
execute as @a[scores={cameraoff=1..}] run gamemode survival @s
execute as @a[scores={cameraoff=1..}] run scoreboard players reset @s cameraon
execute as @a[scores={cameraoff=1..}] run scoreboard players reset @s cameraoff

