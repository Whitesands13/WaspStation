/datum/species/human
	name = "Human"
	id = "human"
	default_color = "FFFFFF"
	species_traits = list(SPECIES_ORGANIC,EYECOLOR,HAIR,FACEHAIR,LIPS)
	mutant_bodyparts = list("tail_human", "ears", "wings")
	default_features = list("mcolor" = "FFF", "tail_human" = "None", "ears" = "None", "wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW
	liked_food = JUNKFOOD | FRIED
	examine_text = "a Human"
	species_text_color = "#2e2e2e"
	loreblurb = "Originating from Earth and making up the bulk of Nanotrasen's workforce, Humans are known for their adaptability and intelligence. \
	 As only a limited amount of trust is afforded to non-Human employees, members of this species can enjoy numerous comforts. \
	 What they lack in scales, claws and tails, they make up for in solidarity and institutionalized racism."


/datum/species/human/qualifies_for_rank(rank, list/features)
	return TRUE	//Pure humans are always allowed in all roles.

//Curiosity killed the cat's wagging tail.
/datum/species/human/spec_death(gibbed, mob/living/carbon/human/H)
	if(H)
		H.endTailWag()

/datum/species/human/on_species_gain(mob/living/carbon/human/H, datum/species/old_species)
	if(H.dna.features["ears"] == "Cat")
		mutantears = /obj/item/organ/ears/cat
	if(H.dna.features["tail_human"] == "Cat")
		var/tail = /obj/item/organ/tail/cat
		mutant_organs += tail
	..()
