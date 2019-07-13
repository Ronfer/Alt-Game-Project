extends KinematicBody2D

#SpawnPoints
export var speed = 140 # Pixels/second

func _init():
	randomize()

func _ready():
	self.position = get_node("/root/Node2D/SpawnPoints").get_child(randi() % 3).position
	$AnimatedSprite.play("IdleDown")


func _process(_delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
		$AnimatedSprite.play("WalkUp")
	if Input.is_action_just_released("move_up"):
        $AnimatedSprite.play("IdleUp")
		
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite.play("WalkDown")
		motion += Vector2(0, 1)
	if Input.is_action_just_released("move_down"):
        $AnimatedSprite.play("IdleDown")

	if Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("WalkLeft")
		motion += Vector2(-1, 0)
	if Input.is_action_just_released("move_left"):
        $AnimatedSprite.play("IdleLeft")

	if Input.is_action_pressed("move_right"):
		$AnimatedSprite.play("WalkRight")
		motion += Vector2(1, 0)
	if Input.is_action_just_released("move_right"):
        $AnimatedSprite.play("IdleRight")

	if Input.is_action_pressed("move_up_left"):
		$AnimatedSprite.play("WalkLeftUp")
		motion += Vector2(-2 ,-1)
	if Input.is_action_just_released("move_up_left"):
		$AnimatedSprite.play("IdleLeftUp")
	
	if Input.is_action_pressed("move_up_right"):
		$AnimatedSprite.play("WalkRightUp")
		motion += Vector2(2 ,-1)
	if Input.is_action_just_released("move_up_right"):
		$AnimatedSprite.play("IdleRightUp")

	if Input.is_action_pressed("move_down_left"):
		$AnimatedSprite.play("WalkLeftDown")
		motion += Vector2(-2 ,1)
	if Input.is_action_just_released("move_down_left"):
		$AnimatedSprite.play("IdleLeftDown")

	if Input.is_action_pressed("move_down_right"):
		$AnimatedSprite.play("WalkDownRight")
		motion += Vector2(2, 1)
	if Input.is_action_just_released("move_down_right"):
		$AnimatedSprite.play("IdleRightDown")

	motion = motion.normalized() * speed

	move_and_slide(motion)
