extends Node
class_name State

@export var animation: String
@export var ms: float

@onready var animations: AnimatedSprite2D = $AnimatedSprite2D

var entity: CharacterBody2D

@export var states: Array[State]

func _ready():
	for state in get_parent().get_children():
			states.append(state)
			
func enter() -> void:
	animations.play(animation)
		
func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
