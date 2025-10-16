extends Node

func _physics_process(_delta: float) -> void:
	Mouse_go_to($MousePosition)
	if Input.is_action_pressed("L_click"):
		go_to($"../Skeletron/InverseKinematicTargets/LHandTarg", $MousePosition)
	if Input.is_action_pressed("R_click"):
		go_to($"../Skeletron/InverseKinematicTargets/RHandTarg", $MousePosition)

func Mouse_go_to(object):
	object.set_global_position(get_viewport().get_mouse_position())
func go_to(object, target):
	object.set_global_position(target.get_global_position())
func move_to(object, target):
	object.move_to()
