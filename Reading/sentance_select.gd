extends Node2D

func _ready():
	#populates lists for the word bank of the madlib
	Global.populate()
	
	#seeds rng
	Global.rng.randomize()
	
	#selects random sentance to be the madlib
	var template = Global.sentance_list[Global.rng.randi_range(0, Global.sentance_list.size() - 1)]
	
	print(template)
	
	#fill labels with words
	$lbl_word1.text = template.substr(0, template.find(" "))
	#remove the first word
	template = template.substr(template.find(" ") + 1)
	
	$lbl_word2.text = template.substr(0, template.find(" "))
	template = template.substr(template.find(" ") + 1)

	$lbl_word3.text = template.substr(0, template.find(" "))
	template = template.substr(template.find(" ") + 1)
	
	$lbl_word4.text = template.substr(0, template.find(" "))
	template = template.substr(template.find(" ") + 1)
	
	$lbl_word5.text = template.substr(0, template.find(" "))
	template = template.substr(template.find(" ") + 1)
	
	$lbl_word6.text = template
