extends Panel

@onready var item_visual: Sprite2D = %ItemDisplay

func update(slot:InventorySlot):
	if !slot.item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
