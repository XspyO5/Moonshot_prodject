class_name HandIkTarget

extends Node2D

@export var hand_node : Node2D
@onready var skeleton_node = $"../.."
@onready var mouse_positon_node = $"../Mouse_position"

var self_angle = 0.0
var target_angle = 0.0

func _ready() -> void:
	self_angle = get_angle(skeleton_node, hand_node)
	target_angle = get_angle(skeleton_node, mouse_positon_node)
	

func go_to(object, target):
	object.set_global_position(target.get_global_position())

func calculate_distance(Node_1, Node_2):
	return sqrt( (Node_1.global_position.x - Node_2.global_position.x)**2 + (Node_1.global_position.y - Node_2.global_position.y)**2 )
	
func get_angle(_node, node2):
	print(node2.global_position.x)
	return 1

func Update(_delta):
	self_angle = get_angle(skeleton_node, hand_node)
	target_angle = get_angle(skeleton_node, mouse_positon_node)
	print("position", hand_node.global_position,"self", rad_to_deg(self_angle), " - target", rad_to_deg(target_angle))
