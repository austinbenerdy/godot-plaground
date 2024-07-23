extends Node


var coins = 0
var levelsCompleted = 0
var bombsFound = 0


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"userId" : 1,
		"coins" : coins,
		"levelsCompleted" : levelsCompleted,
		"bombsFound" : bombsFound,
	}
	return save_dict
