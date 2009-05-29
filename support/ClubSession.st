Seaside.WASession subclass: ClubSession [
	| database |
	
	initialize [
		super initialize.
		database := ClubDatabase new.
	]

	database [ ^ database ]
]


ObjectMemory snapshot: 'seaside.im'
