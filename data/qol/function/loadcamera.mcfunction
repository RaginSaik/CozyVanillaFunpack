scoreboard objectives add cameraon trigger "CameraOn"
scoreboard players reset @a cameraon 
scoreboard objectives add cameraoff trigger "CameraOff"
scoreboard players reset @a cameraoff 
scoreboard objectives add cameracounter dummy "CameraCounter"
scoreboard players reset playersincam cameracounter 
scoreboard objectives add cameratp dummy "CameraTp"
scoreboard players reset @a cameratp
scoreboard objectives add camtpdummy dummy
scoreboard players reset @e camtpdummy