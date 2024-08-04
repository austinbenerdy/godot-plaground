extends Area2D


var secretValue = 1
@onready var label = $Label

var bomb : bool = false
var coin : bool = false
var neighboringBombs : int = 0
var marked : bool = false
var labelText := "?"
var location : Vector2i

signal on_enter_card(currentPosition)

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Card Dropped")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	on_enter_card.emit(location)
	if marked:
		return

	if bomb:
		labelText = "B"
		body.die()
	elif coin:
		labelText = "C"
	else:
		labelText = str(neighboringBombs)
	
	updateLabel()

func updateLabel():
	if marked: 
		label.text = "M"
	else:
		label.text = labelText
		
func setBomb(newValue : bool): 
	bomb = newValue
	
func setCoin(newValue : bool): 
	coin = newValue
	
func setNeighboringBombs(newValue : int):
	neighboringBombs = newValue

func setLocation(newLocation : Vector2i):
	location = newLocation

func mark():
	marked = !marked
	updateLabel()
