class_name HandIkTarget

extends Node2D

@export var is_right : bool
@export var hand_node : Node2D
@export var skeleton_node : Node2D
@onready var mouse_positon = get_viewport().get_mouse_position()
@onready var core_node = $"../.."

var self_angle = 0.0
var mouse_angle = 0.0
var value_ang_difference: float
var self_distance = 0.0
var mouse_distance = 0.0
var lower_limit: float #minimum angle
var upper_limit: float #maximum angle
var max_distance = 350 #maxiumum distance
var min_distance = 100 #maxiumum distance - yet to define
var anglular_speed: float

func calculate_limit():
	upper_limit =  3.0/4.0 * PI + core_node.global_rotation
	lower_limit =  -2.0/3.0 * PI + core_node.global_rotation
	print("h -",lower_limit)
	
	if(is_right == true):
		lower_limit = PI - lower_limit
		upper_limit = PI - upper_limit


func move(target, speed):
	position = position.move_toward(target, speed)

func calc_mouse_distance():
	return sqrt( (skeleton_node.global_position.x - mouse_positon.x)**2 + (skeleton_node.global_position.y - mouse_positon.y)**2 )

func calc_self_distance():
	return sqrt( (skeleton_node.global_position.x - hand_node.global_position.x)**2 + (skeleton_node.global_position.y - hand_node.global_position.y)**2 )

func calc_self_angle():
	var result = atan2((hand_node.global_position.y - skeleton_node.global_position.y) , (hand_node.global_position.x - skeleton_node.global_position.x))
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
	calculate_limit()
	
	value_ang_difference = angle_difference(self_angle, mouse_angle)
	
	self_distance = mouse_distance
	
	if((value_ang_difference < 0 && self_angle < upper_limit) || (value_ang_difference > 0 && self_angle > lower_limit)):
		print("it works")
		self_angle = self_angle + value_ang_difference*self_distance/3500
	
	
	global_position = Vector2(self_distance*cos(self_angle) + skeleton_node.global_position.x, self_distance*sin(self_angle) + skeleton_node.global_position.y)
	print(hand_node," - ",self_angle," - ",upper_limit," - ",self_angle > lower_limit, "-", value_ang_difference > 0)
