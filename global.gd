extends Node

var is_dragging = false

#create varible for file
var nouns = "res://txt/Nouns.txt"
var adjectives = "res://txt/Adjectives.txt"
var verbs = "res://txt/Verbs.txt"
var sentances = "res://txt/Sentances.txt"

#creates random number generator
var rng  = RandomNumberGenerator.new()

var noun_res = FileAccess.open(nouns, FileAccess.READ)
var adjective_res = FileAccess.open(adjectives, FileAccess.READ)
var verb_res = FileAccess.open(verbs, FileAccess.READ)
var sentance_res = FileAccess.open(sentances, FileAccess.READ)

#create an array for all all the files
var noun_list = []
var adjective_list = []
var verb_list = []
var sentance_list = []
	
func populate() -> void:
	#populates the array with words from the file
	#while the cursor is with in the text keep looping
	while !noun_res.eof_reached():
		noun_list.append(noun_res.get_line())
	noun_list.remove_at(noun_list.size() - 1)
	
	#populates array of adjectives
	while !adjective_res.eof_reached():
		adjective_list.append(adjective_res.get_line())
	adjective_list.remove_at(adjective_list.size() - 1)
		
	#populates array of verbs
	while !verb_res.eof_reached():
		verb_list.append(verb_res.get_line())
	verb_list.remove_at(verb_list.size() - 1)
		
	#populates array of sentances
	while !sentance_res.eof_reached():
		sentance_list.append(sentance_res.get_line())
	sentance_list.remove_at(sentance_list.size() - 1)
