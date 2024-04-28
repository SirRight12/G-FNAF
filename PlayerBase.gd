extends Camera3D
class_name PlayerBase
@export var start:PLACES
@export_category("Stuff")
@export var left:Vector3
@export var neutral:Vector3
@export var right:Vector3
@export var dur:float = .1
@export_category("Debug")
@export var test_right:bool:
	set = set_right
@export var test_neutral:bool:
	set = set_neutral
@export var test_left:bool:
	set = set_left
@onready var place = start
signal on_left()
signal on_neutral()
signal on_right()
enum PLACES{LEFT,NEUTRAL,RIGHT}
signal tween_done()
func set_to_place():
	match (place):
		0:
			set_left()
			return
		1:
			set_neutral()
			return
		2:
			set_right()
			return
func tween(property:String,final:Vector3,duration:float):
	var tweener = create_tween().tween_property(self,property,final,duration)
	await tweener.finished
	tween_done.emit()
func set_right(_val=false):
	test_right = false
	tween("rotation",right,.1)
	on_right.emit()
func set_neutral(_val=false):
	test_neutral = false
	tween("rotation",neutral,dur)
	on_neutral.emit()
func set_left(_val=false):
	test_left = false
	tween("rotation",left,dur)
	on_left.emit()
