extends Camera2D

enum directions {LEFT = -1, RIGHT = 1}
onready var childIndex = 2 setget , _get_child_index
onready var scenes = get_node("/root/Node2D/Scenes")


func _get_child_index():
	return childIndex

func _on_SwipeDetector_swiped(direction):
	if direction.x == directions.LEFT and childIndex > 0:
		self.childIndex -= 1
		self.position = scenes.get_child(childIndex).position	
		
	if direction.x == directions.RIGHT and childIndex < 3:
		self.childIndex +=1
		self.position = scenes.get_child(childIndex).position	
