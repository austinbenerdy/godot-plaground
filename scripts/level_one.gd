extends Node2D

@onready var puzzle = $PuzzleContainer
@onready var exit = $Exit

# Called when the node enters the scene tree for the first time.
func _ready():
	#puzzle.set_meta("Columns", 3)
	#puzzle.set_meta("Rows", 4)
	#puzzle.set_meta("Bombs", 2)
	var puzzleContainerNode = get_node("PuzzleContainer")
	exit.character_enters_exit.connect(puzzle._calculate_gold_earned)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
