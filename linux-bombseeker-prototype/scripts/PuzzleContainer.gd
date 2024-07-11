extends Node

var cols : int = 10
var rows : int = 10

var puzzle : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	cols = self.cols
	rows = self.rows
	
	var desiredBombs := 10
	if ((cols * rows) < desiredBombs):
		print("Impossible Map")
		desiredBombs = 0
	
	
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
	render()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func printPuzzleDebug():
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

func render():
	var cardType = load("res://scenes/Card.tscn")
	var blockType = load("res://scenes/BorderBlock.tscn")
	
	
	for r in range(puzzle.size()):
		var line = ""
		var puzzleNode = get_node("Puzzle")
		
		var leftBlockInstance = blockType.instantiate()
		leftBlockInstance.set_name("LeftBlock_" + str(r))
		leftBlockInstance.position.y = r * 24 - 110
		leftBlockInstance.position.x = - 130
		#get_node("Puzzle").add_child(leftBlockInstance)
		puzzleNode.add_child(leftBlockInstance)
		
		for c in range(puzzle[r].size()):
			var card = cardType.instantiate()
			card.set_name("Card_" + str(r) + "_" + str(c))
			card.setBomb(puzzle[r][c]["bomb"])
			card.setNeighboringBombs(puzzle[r][c]["neighbors"])
			card.position.x = c * 24 - 100
			card.position.y = r * 24 - 100

			print(card)
			puzzleNode.add_child(card)			
			if puzzle[r][c]["bomb"]: 
				line += "[X]"
			elif puzzle[r][c]["neighbors"] > 0:
				line += "[" + str(puzzle[r][c]["neighbors"]) + "]"
			else:
				line += "[ ]"
		print(line)
	
		var rightBlockInstance = blockType.instantiate()
		rightBlockInstance.set_name("RightBlock_" + str(r))
		rightBlockInstance.position.x = puzzle[r].size() * 25 - 115
		rightBlockInstance.position.y = r * 24 - 110
		
		puzzleNode.add_child(rightBlockInstance)
