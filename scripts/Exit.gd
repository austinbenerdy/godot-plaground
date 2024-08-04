extends Area2D

var secretValue = 1
@onready var label = $Label

var bomb : bool = false
var coin : bool = false
var neighboringBombs : int = 0

signal character_enters_exit

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Card Dropped")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	character_enters_exit.emit()
	body.die()

func setBomb(newValue : bool): 
	bomb = newValue
	
func setCoin(newValue : bool): 
	coin = newValue
	
func setNeighboringBombs(newValue : int):
	neighboringBombs = newValue
	

	
