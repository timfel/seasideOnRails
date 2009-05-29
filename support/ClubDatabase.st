Object subclass: ClubDatabase [
	| Events |
	
	initialize [
		super initialize.
		Events := OrderedCollection new.
	]

	addEvent: aClubEvent [
		Events add: aClubEvent
	]
]

ObjectMemory snapshot: 'seaside.im'
