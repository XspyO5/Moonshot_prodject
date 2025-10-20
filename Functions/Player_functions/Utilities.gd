class_name IkUtlities
extends Node


static func go_to(object, target):
	object.set_global_position(target.get_global_position())
static func calculate_distance(Node_1, Node_2):
	return sqrt((Node_1.global_position.x - Node_2.global_position.x)*(Node_1.global_position.x - Node_2.global_position.x) + (Node_1.global_position.y - Node_2.global_position.y)*(Node_1.global_position.y - Node_2.global_position.y))
	
	
static func get_angle(Node_1, Node_2):
	return atan2(Node_1.global_position.y - Node_2.global_position.y, Node_1.global_position.x - Node_2.global_position.x)
