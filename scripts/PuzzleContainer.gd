extends Node

var cols : int = 0
var rows : int = 0

var puzzle : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	cols = 5
	rows = 5
	
	var desiredBombs := 5
	
	var cardType = load("res://scenes/Card.tscn")
	
	var bombCount : int = 0
	
	var bombLocations := []
	
	for i in range(desiredBombs):
		var location := Vector2i()
		
		location.x = randi_range(0, cols - 1)
		location.y = randi_range(0, rows - 1)
		
		while bombLocations.has(location): 
			location.x = randi_range(0, cols - 1)
			location.y = randi_range(0, rows - 1)
		
		bombLocations.append(location)
		
	print(bombLocations)
		
	for r in range(rows):

		var row := []
		
		for c in range(cols): 
			#var card = cardType.instantiate()
			var isBomb = bombLocations.has(Vector2i(c, r))
			var isCoin = false
				
			if !isBomb && randi_range(0, 100): 
				isCoin = true
				
			var neighbors = [
				bombLocations.has(Vector2i(c + 1, r)),
				bombLocations.has(Vector2i(c - 1, r)),
				bombLocations.has(Vector2i(c, r + 1)),
				bombLocations.has(Vector2i(c, r - 1)),
				bombLocations.has(Vector2i(c + 1, r + 1)),
				bombLocations.has(Vector2i(c + 1, r - 1)),
				bombLocations.has(Vector2i(c - 1, r + 1)),
				bombLocations.has(Vector2i(c - 1, r - 1)),
				
			].count(true)
				
			var config = {
				"bomb": isBomb,
				#"coin": isCoin,
				"neighbors" : neighbors,
			}
			
			row.append(config)
			
		print(row)
		puzzle.append(row)
		
	print(puzzle)
	printPuzzleDebug()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func printPuzzleDebug():
		var output := ""
		for r in range(puzzle.size()):
			var line = ""
			
			for c in range(puzzle[r].size()):
				if puzzle[r][c]["bomb"]: 
					line += "[X]"
				elif puzzle[r][c]["neighbors"] > 0:
					line += "[" + str(puzzle[r][c]["neighbors"]) + "]"
				else:
					line += "[ ]"
			print(line)
