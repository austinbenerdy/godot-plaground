extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Card Dropped")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Reveal Value")
