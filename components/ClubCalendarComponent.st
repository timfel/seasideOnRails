
Seaside.WAComponent subclass: ClubCalendarComponent [
	ClubCalendarComponent class >> canBeRoot [ ^ true ]
	
	initialize [ super initialize ]

	renderContentOn: html [
		html text: 'Calendar'
	]
]

ObjectMemory snapshot: 'seaside.im'
