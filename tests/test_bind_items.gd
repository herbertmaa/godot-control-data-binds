extends GutTest

const BOUND_ITEM_LIST = preload("res://tests/bound_item_list.tscn")


func test_bind_items_itemlist():
	var item_list := BOUND_ITEM_LIST.instantiate()
	add_child_autoqfree(item_list)
	await wait_frames(1)

	assert_eq(item_list.get_item_count(), 3, "Items loaded")
	item_list.items[0].selected = true
	DataBindings._detect_changes()
	assert_eq(item_list.selected_item, item_list.items[0], "selected_item updated")

	item_list.selected_item = item_list.items[1]
	DataBindings._detect_changes()
	assert_eq(item_list.items[1].selected, true, "item.selected updated")
	assert_eq(item_list.items[0].selected, false, "old item.selected updated")
