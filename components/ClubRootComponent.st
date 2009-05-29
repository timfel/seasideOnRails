
Seaside.WAComponent subclass: ClubRootComponent [
	ClubRootComponent class >> canBeRoot [ ^ true ]
	
	initialize [ super initialize ]

	renderContentOn: html [
	]
]

ClubRootComponent registerAsApplication: 'ClubRootComponent'.
ObjectMemory snapshot: 'seaside.im'

