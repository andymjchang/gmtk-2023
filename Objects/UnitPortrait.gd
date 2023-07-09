extends AnimatedSprite

func load_info(p_animName, p_name, p_dmg):
	get_node("PortraitLabel").text = p_name + "\nDMG:" + str(p_dmg)
	animation = p_animName 
