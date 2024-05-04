extends Node3D

@onready var debug_light = $DEBUG
func _ready():
	debug_light.visible = false
