/obj/item/clothing/head/soft
	name = "cargo cap"
	desc = "It's a peaked cap in a tasteless yellow color."
	icon_state = "cargosoft"
	item_state_slots = list(
		slot_l_hand_str = "helmet", //probably a placeholder
		slot_r_hand_str = "helmet",
		)
	var/flipped = 0
	siemens_coefficient = 0.9
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/soft/New()
	..()
	update_icon()

/obj/item/clothing/head/soft/on_update_icon()
	if(flipped)
		icon_state = "[initial(icon_state)]_flipped"
	else
		icon_state = initial(icon_state)

/obj/item/clothing/head/soft/dropped()
	src.flipped=0
	update_icon()
	..()

/obj/item/clothing/head/soft/attack_self(mob/user)
	src.flipped = !src.flipped
	if(src.flipped)
		to_chat(user, "You flip the hat backwards.")
	else
		to_chat(user, "You flip the hat back in normal position.")
	update_icon()
	update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "red cap"
	desc = "It's a baseball hat in a tasteless red color."
	icon_state = "redsoft"

/obj/item/clothing/head/soft/blue
	name = "blue cap"
	desc = "It's a peaked cap in a tasteless blue color."
	icon_state = "bluesoft"

/obj/item/clothing/head/soft/green
	name = "green cap"
	desc = "It's a peaked cap in a tasteless green color."
	icon_state = "greensoft"

/obj/item/clothing/head/soft/yellow
	name = "yellow cap"
	desc = "It's a peaked cap in a tasteless yellow color."
	icon_state = "yellowsoft"

/obj/item/clothing/head/soft/grey
	name = "grey cap"
	desc = "It's a peaked cap in a tasteful grey color."
	icon_state = "greysoft"

/obj/item/clothing/head/soft/orange
	name = "orange cap"
	desc = "It's a peaked cap in a tasteless orange color."
	icon_state = "orangesoft"

/obj/item/clothing/head/soft/mime
	name = "white cap"
	desc = "It's a peaked cap in a tasteless white color."
	icon_state = "mimesoft"

/obj/item/clothing/head/soft/purple
	name = "purple cap"
	desc = "It's a peaked cap in a tasteless purple color."
	icon_state = "purplesoft"

/obj/item/clothing/head/soft/rainbow
	name = "rainbow cap"
	desc = "It's a peaked cap in a bright rainbow of colors."
	icon_state = "rainbowsoft"

/obj/item/clothing/head/soft/sec
	name = "security cap"
	desc = "It's a field cap in tasteful red color. This one seems to be extra durable."
	icon_state = "secsoft"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/soft/sec/fieldcap
	name = "military cap"
	desc = "It's a military field cap with a silver emblem on it. This one seems to be extra durable."
	icon_state = "dalek_cap"
	armor = list(melee = 35, bullet = 25, laser = 25,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	desc = "It's field cap in corporate colors. This one seems to be extra durable."
	icon_state = "corpsoft"

/obj/item/clothing/head/soft/mbill
	name = "shipping cap"
	desc = "It's a ballcap bearing the colors of Major Bill's Shipping."
	icon_state = "mbillsoft"

/obj/item/clothing/head/soft/black
	name = "black cap"
	desc = "It's a peaked cap in a tasteful black color."
	icon_state = "blacksoft"

/obj/item/clothing/head/soft/sec/corp/guard
	name = "\improper NanoTrasen security cap"
	desc = "It's field cap in NanoTrasen colors. This one seems to be extra durable."
	icon_state = "ntwhitesoft"
