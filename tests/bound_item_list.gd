extends ItemList

var items: Array[Dictionary]
var selected_item


func _ready():
	items.assign(
		[
			{name = "one", selected = false},
			{name = "two", selected = false},
			{name = "three", selected = false}
		]
	)
