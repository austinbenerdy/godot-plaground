extends Area2D


var secretValue = 1
@onready var label = $Label

var bomb : bool = false
var coin : bool = false
var neighboringBombs : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Card Dropped")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Reveal Value")
	label.text = str(secretValue)
	

func setBomb(newValue : bool): 
	bomb = newValue
	
func setCoin(newValue : bool): 
	coin = newValue
	
func setNeighboringBombs(newValue : int):
	neighboringBombs = newValue
	

	
