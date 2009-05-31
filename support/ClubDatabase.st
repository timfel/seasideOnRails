Object subclass: ClubDatabase [

	Events := OrderedCollection new.
	Users := OrderedCollection new.
	News := OrderedCollection new.
	
	initialize [ super initialize ]

	events [ ^ Events ]
	users [ ^ Users ]
	news [ ^ News ]

	addEvent: aClubEvent [ Events add: aClubEvent ]
	addUser: aClubUser [ Users add: aClubUser ]
	addNews: aClubNewsitem [ News add: aClubNewsitem ]
]

ObjectMemory snapshot: 'seaside.im'
