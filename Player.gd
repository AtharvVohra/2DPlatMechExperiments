extends Node2D

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	check_input(delta)
	movement_loop(delta)
	
func check_input(delta):
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var JUMP 	= Input.is_action_pressed("ui_up")
	
	Globals.directionVector.x = -int(LEFT) + int(RIGHT)
	Globals.directionVector.y = -int(JUMP)
	
func movement_loop(delta):
	
	Globals.directionVector.y += Globals.GRAVITY
	
	var motion = Globals.directionVector.normalized() * Globals.MOVESPEED
	var collision = $KinematicBody2D.move_and_collide(motion*delta)
	

