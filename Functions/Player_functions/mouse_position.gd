extends Node2D



func _physics_process(_delta: float) -> void:
	
	$".".set_global_position(get_viewport().get_mouse_position())
	
