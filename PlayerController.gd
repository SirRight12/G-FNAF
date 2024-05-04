extends PlayerBase
class_name PlayerController
var can_turn = true
@export var turn_delay = 0.1
@onready var light:SpotLight3D = $SpotLight3D
var in_cams = false
func _ready():
	on_left.connect(_on_left)
	on_right.connect(_on_right)
	on_neutral.connect(_on_neutral)
	set_to_place()
	var timer = timeout(2)
	await timer.timeout
func look_to_cams():
	pass
func _on_left():
	light.light_energy = 1.0
func _on_right():
	light.light_energy = 1.0
func _on_neutral():
	light.light_energy = 0.0
func _unhandled_input(event):
	handle_turning(event)
func handle_turning(event):
	if !event is InputEventMouseMotion: return
	var viewport = get_viewport()
	var x = viewport.get_mouse_position().x
	var sx = viewport.size.x
	var px = x/sx
	var turned = false
	if !can_turn: return
#	Left
	if px < .2:
		var prev_place = place
		turned = true
		place -= 1
		place = clamp(place,0,2)
		if prev_place == place:
			turned = false
#	Right
	elif px > .8:
		turned = true
		var prev_place = place
		place += 1
		place = clamp(place,0,2)
		if prev_place == place:
			turned = false
	if turned:
		can_turn = false
		var timer = timeout(turn_delay)
		timer.timeout.connect(refresh_turn)
		set_to_place()
func refresh_turn():
	can_turn = true
func timeout(time:float):
	var timer = get_tree().create_timer(time)
	return timer
