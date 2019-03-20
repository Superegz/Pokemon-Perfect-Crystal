const_value set 2
	const CERULEANCAVEB1_MEWTWO

CeruleanCaveB1_MapScriptHeader:
.MapTriggers: 
	db 0

.MapCallbacks:
	db 1
	
	; callbacks
	
	dbw MAPCALLBACK_OBJECTS, .MewtwoCheck

.MewtwoCheck:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .DisappearMewtwo
	return

.DisappearMewtwo
	disappear CERULEANCAVEB1_MEWTWO
	return
	
MewtwoBattle:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEWTWO, 70
	startbattle
	disappear CERULEANCAVEB1_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "It's been many"
	line "years since I've"
	cont "last seen a human."
	
	para "The only one I've"
	line "ever respected…"
	
	para "I doubt you're"
	line "another."
	done
	
CeruleanCaveB1_MapEventHeader:: db 0, 0

.Warps: 
	db 1
	warp_def 5, 3, 8, CERULEAN_CAVE_1F
	
.XYTriggers: 
	db 0

.Signposts:
	db 0

.PersonEvents: 
	db 1
	person_event SPRITE_MONSTER, 13, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MewtwoBattle, EVENT_FOUGHT_MEWTWO
