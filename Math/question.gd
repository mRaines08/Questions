extends Node2D

#creates random number generator
var rng = RandomNumberGenerator.new()

#creates varible to track sum
var sum = -1

#runs when program runs, calls sayHi function
func _ready():
	#places cursor in lneAnswer
	$lneAnswer.grab_focus()
	
	#instantiates random number genorator? i think?
	rng.randomize()
	
	#creates varibles for numbers to be added
	var num1 = rng.randi_range(0,10)
	var num2 = rng.randi_range(0,10)
	sum = num1 + num2
	
	#change text in label to create a math problem
	$lblProblem.text = str(num1) + " + " + str(num2) + " ="

func _on_lne_answer_text_submitted(new_text: String) -> void:
	if $lneAnswer.text == str(sum):
		get_tree().change_scene_to_file("res://Math/Correct.tscn")
	else:
		get_tree().change_scene_to_file("res://Math/Wrong.tscn")
