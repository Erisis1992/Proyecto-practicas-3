extends Label

const accel = 5.0
const deccel = 20
const max_speed = 30
var cur_sped = 0

	
func _on_player_count():
	while cur_sped>max_speed:
		cur_sped += accel
		if cur_sped==max_speed:
			cur_sped=max_speed
			break
	text = "Velocidad: %s" % cur_sped
func _on_player_max():
	text = "Velocidad: max"
func _on_player_decount():
	while cur_sped != 0:
		cur_sped-=deccel*1.5
		if cur_sped==0:
			cur_sped=0
			break
	text = "Velocidad: %s" % cur_sped
