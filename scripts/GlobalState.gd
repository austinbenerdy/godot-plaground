extends Node

var levelsCompleted : int = 0
var coins : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var data = load_save()
	coins = data.coins
	levelsCompleted = data.levelsCompleted
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_save_data():
	var save_data = {
		'coins': coins,
		'levelsCompleted': levelsCompleted
	}
	
	return save_data
	
func save():
	var save_file = FileAccess.open('user://bombseeker.save', FileAccess.WRITE)
	var data = JSON.stringify(get_save_data())
	
	save_file.store_line(data)
	

func load_save():
	if not FileAccess.file_exists('user://bombseeker.save'):
		return {
			'coins': 0,
			'levelsCompleted': 0,
		}
		
		
	var game_save = FileAccess.open('user://bombseeker.save', FileAccess.READ)
	
	var state
	while game_save.get_position() < game_save.get_length():
		var data = game_save.get_line()
		var json_parser = JSON.new()
		
		var result = json_parser.parse(data)
		state = json_parser.data
		
		print(state);
	return state
