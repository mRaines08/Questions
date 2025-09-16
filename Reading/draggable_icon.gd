extends Node2D

#create varibles
var draggable = false
var is_inside_dropable = false
var body_ref
#creates a varible for the point inital position with x,y components
var initialPos : Vector2

#when mouse enters icon
func _on_icon_area_mouse_entered() -> void:
	#if player is not dragging anything else
	if not Global.is_dragging:
		draggable = true
		#scales sprite for player feedback
		scale = Vector2(1.05, 1.05)

#when mouse exits icon
func _on_icon_area_mouse_exited() -> void:
	#if player is not dragging anything else
	if not Global.is_dragging:
		draggable = false
		#scales sprite back to normal size
		scale = Vector2(1,1)
		
#runs when a body enters the icon area
func _on_icon_area_body_entered(body: Node2D) -> void:
	#confirms the area is a droppable area
	if body.is_in_group('droppable'):
		is_inside_dropable = true
		#change drop zone color for user feedback
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body
		print(body_ref)

#runs when a body exits the icon area
func _on_icon_area_body_exited(body: Node2D) -> void:
	#confirms the area is a droppable area
	if body.is_in_group('droppable'):
		is_inside_dropable = false
		#reset sprite
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)


#runs every frame
func _process(delta):
	if draggable:
		#when mouse is clicked
		if Input.is_action_pressed("click"):
			#sets inital position
			initialPos = global_position
			#sets position of icon to mouse position
			global_position = get_global_mouse_position()
			#set is dragging to true
			Global.is_dragging  = true
		#when mouse is released
		elif Input.is_action_just_released("click"):
			#set is_drgging to false
			Global.is_dragging = false
			#create tween to smooth animation
			var tween = get_tree().create_tween()
			#if icon is inside drop zone
			if is_inside_dropable:
				#edit the position property of the icon to the position of the drop_zone (body_ref), complete the animation in 0.2 sec
				#ease the animation to end slow
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(tween.EASE_OUT)
			#if icon is not in drop zone
			else:
				#send icon back to orignial position
				tween.tween_property(self,"global_position", initialPos, 0.2).set_ease(tween.EASE_OUT)
