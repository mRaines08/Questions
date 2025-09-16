extends Node2D

func _ready():
	#populates lists for the word bank of the madlib
	Global.populate()
	
	#seeds rng
	Global.rng.randomize()
	
	#selects random sentance to be the madlib
	var template = Global.sentance_list.pick_random()
	
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
	
	#Create an array of the arrays of each word type
	var word_bank = [Global.noun_list, Global.adjective_list, Global.verb_list]
	
	#randomize order of lists
	word_bank.shuffle()
	
	#fills draggable icons with random words
	$draggable_icon/word.text = word_bank[0].pick_random()
	$draggable_icon2/word.text = word_bank[1].pick_random()
	$draggable_icon3/word.text = word_bank[2].pick_random()
