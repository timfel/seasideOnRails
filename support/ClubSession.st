Seaside.WASession subclass: ClubSession [
	| database user |
	
	initialize [
		super initialize.
		database := ClubDatabase new.
		user := nil.
	]

	database [ ^ database ]

	isLoggedIn [ ^ user isNil not ]
	login: aClubUser [ user := aClubUser ]
	username [ ^ user username ]
	user [ ^ user ]
]

ObjectMemory snapshot: 'seaside.im'
