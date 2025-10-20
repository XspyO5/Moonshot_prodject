extends Node2D

func _physics_process(_delta: float) -> void:
	
	print(IkUtlities.get_angle($"../MousePosition",$"."))
