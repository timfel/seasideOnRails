
Seaside.WAComponent subclass: ClubSideBarComponent [
	ClubSideBarComponent class >> canBeRoot [ ^ true ]
	
	initialize [ super initialize ]

	renderContentOn: html [
	]
]

ObjectMemory snapshot: 'seaside.im'
