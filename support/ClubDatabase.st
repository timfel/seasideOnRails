Object subclass: ClubDatabase [

	Events := OrderedCollection new.
	
	initialize [
		super initialize.
		Events := OrderedCollection new.
	]

	events [
		^ Events
	]

	addEvent: aClubEvent [
		Events add: aClubEvent
	]
]

ObjectMemory snapshot: 'seaside.im'
