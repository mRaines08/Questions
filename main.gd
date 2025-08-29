extends Node

#creates string varible to hold text
var myHello = "Hello World!"

#creates random number generator
var rng = RandomNumberGenerator.new()

#create answer varible for the scene
var numPlace = 0

#runs when program runs, calls sayHi function
func _ready():
	
	#instantiates random number genorator? i think?
	rng.randomize()
	#prints a random int between 0 - 10 inclusive
	print(rng.randi_range(0,10))
	
	#$ is short hand for get_node() which allows you to access properties of a child node
	var lblProblem = $lblProblem
	var btn1 = $btn1
	var btn2 = $btn2
	var btn3 = $btn3
	var btn4 = $btn4
	
	#creates varibles for numbers to be added
	var num1 = rng.randi_range(0,10)
	var num2 = rng.randi_range(0,10)
	numPlace = rng.randi_range(1,4)
	
	print("num1 = " + str(num1))
	print("num2 = " + str(num2))
	print("numPlace = " + str(numPlace))
	
	#change text in label to create a math problem
	lblProblem.text = str(num1) + " + " + str(num2) + " ="
	
	#add the answers to the buttons
	if(numPlace == 1):
		btn1.text = str(num1 + num2)
		btn2.text = str(rng.randi_range(0,10))
		btn3.text = str(rng.randi_range(0,10))
		btn4.text = str(rng.randi_range(0,10))
	elif(numPlace == 2):
		btn1.text = str(rng.randi_range(0,10))
		btn2.text = str(num1 + num2)
		btn3.text = str(rng.randi_range(0,10))
		btn4.text = str(rng.randi_range(0,10))
	elif(numPlace == 2):
		btn1.text = str(rng.randi_range(0,10))
		btn2.text = str(rng.randi_range(0,10))
		btn3.text = str(num1 + num2)
		btn4.text = str(rng.randi_range(0,10))
	else:
		btn1.text = str(rng.randi_range(0,10))
		btn2.text = str(rng.randi_range(0,10))
		btn3.text = str(rng.randi_range(0,10))
		btn4.text = str(num1 + num2)
	
func _on_btn_1_button_down() -> void:
	if(numPlace == 1):
		get_tree().change_scene_to_file("res://Correct.tscn")
	else:
		get_tree().change_scene_to_file("res://Wrong.tscn")

#when btn2 is pressed use get_tree to access tree methods then use the meathod to change to the correct scene
func _on_btn_2_button_down() -> void:
	if(numPlace == 2):
		get_tree().change_scene_to_file("res://Correct.tscn")
	else:
		get_tree().change_scene_to_file("res://Wrong.tscn")


func _on_btn_3_button_down() -> void:
	if(numPlace == 3):
		get_tree().change_scene_to_file("res://Correct.tscn")
	else:
		get_tree().change_scene_to_file("res://Wrong.tscn")


func _on_btn_4_button_down() -> void:
	if(numPlace == 4):
		get_tree().change_scene_to_file("res://Correct.tscn")
	else:
		get_tree().change_scene_to_file("res://Wrong.tscn")
