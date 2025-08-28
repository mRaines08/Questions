extends Node

#creates string varible to hold text
var myHello = "Hello World!"

#creates random number generator
var rng = RandomNumberGenerator.new()

#print message
func sayHi():
	print(myHello)

#runs when program runs, calls sayHi function
func _ready():
	print(myHello)
	#instantiates random number genorator? i think?
	rng.randomize()
	#prints a random int between 0 - 10 inclusive
	print(rng.randi_range(0,10))

func _on_no_button_down() -> void:
	get_tree().change_scene_to_file("res://Wrong.tscn")

#when yes is pressed use get_tree to access tree methods then use the meathod to change to the correct scene
func _on_yes_button_down() -> void:
	get_tree().change_scene_to_file("res://Correct.tscn")
