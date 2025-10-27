class_name HandIkTarget

extends Node2D

@export var is_right : bool
@export var hand_node : Node2D
@export var skeleton_node : Node2D
@onready var mouse_positon = get_viewport().get_mouse_position()

var self_angle = 0.0
var mouse_angle = 0.0
var self_distance = 0.0
var mouse_distance = 0.0
var lower_limit #minimum angle
var upper_limit #maximum angle
var max_distance = 350 #maxiumum distance



func move(target, speed):
	position = position.move_toward(target, speed)

func calc_mouse_distance():
	return sqrt( (skeleton_node.global_position.x - mouse_positon.x)**2 + (skeleton_node.global_position.y - mouse_positon.y)**2 )

func calc_self_distance():
	return sqrt( (skeleton_node.global_position.x - hand_node.global_position.x)**2 + (skeleton_node.global_position.y - hand_node.global_position.y)**2 )

func calc_self_angle():
	var result = atan2((hand_node.global_position.y - skeleton_node.global_position.y) , (hand_node.global_position.x - skeleton_node.global_position.x)) + PI
	return result
	
func calc_mouse_angle():
	var result = atan2(mouse_positon.y - skeleton_node.global_position.y, mouse_positon.x - skeleton_node.global_position.x )
	#if(is_right):
	#	if(result > 0):
	#		result = PI - result
	#	else:
	#		result = -PI - result
	
	return result
	
func Update(_delta):
	mouse_positon = get_viewport().get_mouse_position()
	self_angle = calc_self_angle()
	mouse_angle = calc_mouse_angle()
	self_distance = calc_self_distance()
	mouse_distance = calc_mouse_distance()
	
	self_distance = mouse_distance
	
	self_angle = lerp_angle(self_angle, mouse_angle, 1)
	
	global_position = Vector2(self_distance*cos(self_angle) + skeleton_node.global_position.x, self_distance*sin(self_angle) + skeleton_node.global_position.y)
	print(rad_to_deg(self_angle)," - ",rad_to_deg(mouse_angle)," - ",lerp_angle(self_angle, mouse_angle, 0.51))
