extends Control

#TODO: button index ja swipe index sync.

onready var scenes = get_node("/root/Node2D/Scenes")
#onready var swipe = get_node("/root/Node2D/SwipeDetector")
#onready var index = get_parent()

func _ready():
#	print(get_node("root/Node2D/Camera2D")._get_child_index()) 
#	print(swipe.test)
	pass

func _on_House_pressed():
	get_parent().position = scenes.get_child(0).position

func _on_Profile_pressed():
	get_parent().position = scenes.get_child(1).position

func _on_Village_pressed():
	get_parent().position = scenes.get_child(2).position

func _on_Clanmenu_pressed():
	get_parent().position = scenes.get_child(3).position