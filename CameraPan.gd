extends Camera3D
@export var left_offset:float
@export var right_offset:float
@export var dur:float = 1.0
@export var delay:float = 1.0
@onready var orignal_rotation:Vector3 = get_rotation()
var pos = 1
func tween(property,val,duration):
	var tweener = create_tween().tween_property(self,property,val,duration)
	await tweener.finished
	return true
func go_to_left():
	await tween("rotation",Vector3(0,left_offset,0)+orignal_rotation,dur)
	pos = 0
	await timeout(delay)
	next()
func go_to_right():
	await tween("rotation",Vector3(0,right_offset,0)+orignal_rotation,dur)
	pos = 2
	await timeout(delay)
	next()
func next():
	match (pos):
		1:
			var rand = randi_range(0,6)
			var chance = rand % 2
			if chance > 0:
				go_to_left()
			else:
				go_to_right()
		0:
			go_to_right()
		2:
			go_to_left()
func _ready():
	next()
func timeout(time):
	var timer = get_tree().create_timer(time)
	await timer.timeout
	return true
