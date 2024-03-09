extends CharacterBody2D


@export var freeMove: bool = true

const SPEED = 100
const ACCEL = .1
const FRIC = .15

@onready var upBox = $up
@onready var downBox = $down
@onready var leftBox = $left
@onready var rightBox = $right

@onready var animations = $AnimatedSprite2D

enum {up, down, left, right}
			
func _process(delta):
	animations.play("idle")
	
func _physics_process(delta):

	match freeMove:
		true:
			match Input.is_anything_pressed():
				true:
					velocity = velocity.lerp(Input.get_vector("left", "right", "up", "down").normalized() * SPEED, ACCEL)
				false:
					velocity = velocity.lerp(Vector2.ZERO, FRIC)
			move_and_slide()
		false:
			if Input.is_action_just_pressed("left") && canMove(leftBox):
				self.position.x -= 32
			if Input.is_action_just_pressed("right") && canMove(rightBox):
				self.position.x += 32
			if Input.is_action_just_pressed("up") && canMove(upBox):
				self.position.y -= 32
			if Input.is_action_just_pressed("down") && canMove(downBox):
				self.position.y += 32
			
func canMove(dir):
	
	if dir.has_overlapping_bodies():
		print("colliding")
		return false
	else:
		print("not colliding")
		return true
