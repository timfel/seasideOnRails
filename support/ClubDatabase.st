Object subclass: ClubDatabase [

	Events := OrderedCollection new.
	
	initialize [
		super initialize.
	]

	events [
		^ Events
	]

	addEvent: aClubEvent [
		Events add: aClubEvent
	]

	reset [
		Events := OrderedCollection new.
	]
]

ObjectMemory snapshot: 'seaside.im'
