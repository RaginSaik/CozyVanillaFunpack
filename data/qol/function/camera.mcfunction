scoreboard players enable @a cameraon
scoreboard players enable @a cameraoff
#make everyone who triggered cameraon spectator and reset trigger
execute as @a[scores={cameraon=1}] run gamemode spectator @s
execute as @a[scores={cameraon=1}] run scoreboard players add playersincam cameracounter 1
execute as @a[scores={cameraon=1}] run scoreboard players operation @s cameratp = playersincam cameracounter
execute at @a[scores={cameraon=1}] run summon minecraft:armor_stand ~ ~ ~ {Invulnerable:true,NoBasePlate:true,NoGravity:true,ShowArms:true,Rotation:[15f],Pose:{Head:[8f,0f,0f],LeftLeg:[283f,347f,354f],RightLeg:[281f,1f,5f],LeftArm:[339f,0f,9f],RightArm:[333f,0f,354f]},ArmorItems:[{id:"leather_boots",Count:1,components:{dyed_color:{rgb:5243046}}},{id:"leather_leggings",Count:1,components:{dyed_color:{rgb:5243046}}},{id:"leather_chestplate",Count:1,components:{dyed_color:{rgb:5243046}}},{id:"player_head",Count:1,components:{profile:{name:"turtle_helmet"}}}],HandItems:[{id:"minecraft:spyglass",Count:1},{}],Tags:["camtemp","camera"]}
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