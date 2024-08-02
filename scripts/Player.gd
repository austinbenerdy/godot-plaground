extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -400.0

@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	if Input.is_action_pressed('mark'):
		return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_dir = Input.get_axis("move_left", "move_right")
	if x_dir:
		sprite.play("move_right")
		if x_dir > 0:
			sprite.flip_h = false
		elif x_dir < 0: 
			sprite.flip_h = true
			
		velocity.x = x_dir * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	var y_dir = Input.get_axis("move_up", "move_down")
	if y_dir:
		if x_dir == 0 && y_dir > 0:
			sprite.play("run_down")
		elif x_dir == 0 && y_dir < 0: 
			sprite.play("run_up")
			
		velocity.y = y_dir * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if x_dir == 0 && y_dir == 0: 
		sprite.play("idle")

	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass
