extends Node3D

@onready var debug_light = $DEBUG
# Called when the node enters the scene tree for the first time.
func _ready():
	debug_light.visible = false
