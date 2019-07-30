extends Node2D
"""
Detects swipe gestures and generates InputEventSwipe events
that are fed back into the engine.
"""
signal swiped(direction)
signal swipe_canceled(start_position)
var test = 38
export(float, 1.0, 1.5) var max_diagonal_slope : = 1.3

onready var timer = $Timer  
var swipe_start_position : = Vector2()

#func _ready():
#	$Timer.connect("timeout", self, "_on_timer_timeout")

func _input(event: InputEvent) -> void: #_unhandled_input
	if not event is InputEventScreenTouch:
		return
	if event.pressed:
		_start_detection(event.position)
	elif not timer.is_stopped():
		_end_detection(event.position)


func _start_detection(position):
	swipe_start_position = position
	print(swipe_start_position)
	timer.start()


func _end_detection(position):
	timer.stop()
	var direction = (position - swipe_start_position).normalized()
	if abs(direction.x) + abs(direction.y) >= max_diagonal_slope:
		return

	if abs(direction.x) > abs(direction.y):
		emit_signal("swiped", Vector2(-sign(direction.x), 0.0))
	else:
		emit_signal("swiped", Vector2(0.0, -sign(direction.x)))	


func _on_Timer_timeout():
	emit_signal('swipe_canceled', swipe_start_position)