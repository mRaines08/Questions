extends Node2D

func _ready():
	#populates lists for the word bank of the madlib
	Global.populate()
	
	#seeds rng
	Global.rng.randomize()
	
	#selects random sentance to be the madlib
	var template = Global.sentance_list.pick_random()
		
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
	
	#place drop_zones
	place_drop_zones($lbl_word1.text, $lbl_word1.position)
	place_drop_zones($lbl_word2.text, $lbl_word2.position)
	place_drop_zones($lbl_word3.text, $lbl_word3.position)
	place_drop_zones($lbl_word4.text, $lbl_word4.position)
	place_drop_zones($lbl_word5.text, $lbl_word5.position)
	place_drop_zones($lbl_word6.text, $lbl_word6.position)
	
	#Create an array of the arrays of each word type
	var word_bank = [Global.noun_list, Global.adjective_list, Global.verb_list]
	
	#randomize order of lists
	word_bank.shuffle()
	
	#fills draggable icons with random words
	$draggable_icon0/word.text = word_bank[0].pick_random()
	$draggable_icon0.assign_meta()
	$draggable_icon1/word.text = word_bank[1].pick_random()
	$draggable_icon1.assign_meta()
	$draggable_icon2/word.text = word_bank[2].pick_random()
	$draggable_icon2.assign_meta()

func place_drop_zones(text: String, pos: Vector2):
		if text.contains("ADJECTIVE"):
			$drop_zone_adjective.position = pos
		if text.contains("VERB"):
			$drop_zone_verb.position = pos
		if text.contains("NOUN"):
			$drop_zone_noun.position = pos

func _on_btn_check_pressed() -> void:
	if $drop_zone_adjective.position == $draggable_icon0.position && $draggable_icon0.get_meta("type") != "ADJECTIVE":
		print("incorrect")
	elif $drop_zone_adjective.position == $draggable_icon1.position && $draggable_icon1.get_meta("type") != "ADJECTIVE":
		print("incorrect")
	elif $drop_zone_adjective.position == $draggable_icon2.position && $draggable_icon2.get_meta("type") != "ADJECTIVE":
		print("incorrect")
	elif $drop_zone_verb.position == $draggable_icon0.position && $draggable_icon0.get_meta("type") != "VERB":
		print("incorrect")
	elif $drop_zone_verb.position == $draggable_icon1.position && $draggable_icon1.get_meta("type") != "VERB":
		print("incorrect")
	elif $drop_zone_verb.position == $draggable_icon2.position && $draggable_icon2.get_meta("type") != "VERB":
		print("incorrect")
	elif $drop_zone_noun.position == $draggable_icon0.position && $draggable_icon0.get_meta("type") != "NOUN":
		print("incorrect")
	elif $drop_zone_noun.position == $draggable_icon0.position && $draggable_icon0.get_meta("type") != "NOUN":
		print("incorrect")
	elif $drop_zone_noun.position == $draggable_icon0.position && $draggable_icon0.get_meta("type") != "NOUN":
		print("incorrect")
	else:
		print("correct")
