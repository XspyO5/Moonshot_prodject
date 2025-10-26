class_name HandIkTarget

extends Node2D

@export var side_RorL : String 
@export var hand_node : Node2D
@export var skeleton_node : Node2D
@onready var mouse_positon = get_viewport().get_mouse_position()

var self_angle = 0.0
var mouse_angle = 0.0
var self_distance = 0.0
var mouse_distance = 0.0

func go_to(object, target):
	object.set_global_position(target.get_global_position())

func calc_mouse_distance():
	return sqrt( (skeleton_node.global_position.x - mouse_positon.x)**2 + (skeleton_node.global_position.y - mouse_positon.y)**2 )

func calc_self_distance():
	return sqrt( (skeleton_node.global_position.x - hand_node.global_position.x)**2 + (skeleton_node.global_position.y - hand_node.global_position.y)**2 )

func calc_self_angle():
	var result = atan2(skeleton_node.global_position.y - hand_node.global_position.y , skeleton_node.global_position.x - hand_node.global_position.x)
	if(side_RorL == "R"):
		result = 180 - result
	return result
	
func calc_mouse_angle():
	var result = atan2(skeleton_node.global_position.y - mouse_positon.y , skeleton_node.global_position.x - mouse_positon.x)
	if(side_RorL == "R"):
		result = PI - result #fix R side for angle grater then 180 sice it use a 0 to 360 scale instead of a -180 to 180 scale
	return result
	
func Update(_delta):
	mouse_positon = get_viewport().get_mouse_position()
	self_angle = calc_self_angle()
	mouse_angle = calc_mouse_angle()
	self_distance = calc_self_distance()
	mouse_distance = calc_self_angle()
	
	print(side_RorL," - ",rad_to_deg(mouse_angle))
