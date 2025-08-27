extends Node

#creates string varible to hold text
var myHello = "Hello World!"

#print message
func sayHi():
	print(myHello)

#runs when program runs, calls sayHi function
func _ready():
	print(myHello)
