extends ProgressBar

var parent
var max_value_amount
var min_value_amount

func _ready():
	parent = get_parent().get_parent()
	max_value_amount = parent.max_moon
	min_value_amount = parent.min_moon
	
func _process(delta):
	self.visible = true
	self.value = parent.moon
	if parent.name != 'player':
		if parent.health != max_value_amount:
			self.visible = true
			if parent.health == min_value_amount:
				self.visible = false
		else:
			self.visible = false