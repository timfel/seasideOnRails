Object subclass: ClubDatabase [

	Events := OrderedCollection new.
	
	initialize [
		super initialize.
	]

	events [
		^ Events
	]

	news [
		| news |
	       	news := OrderedCollection new.	
		Events do: [:event | 
		    news addAll: event newsItems].
		^ news
	]

	addEvent: aClubEvent [
		Events add: aClubEvent
	]

	reset [
		Events := OrderedCollection new.
	]
]

ObjectMemory snapshot: 'seaside.im'
