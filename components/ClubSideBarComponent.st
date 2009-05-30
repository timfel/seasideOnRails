
Seaside.WAComponent subclass: ClubSideBarComponent [
	| calendarComponent |

	ClubSideBarComponent class >> canBeRoot [ ^ true ]
	
	initialize [ 
		super initialize.
	        calendarComponent := ClubCalendarComponent new ]

	children [ ^ Array with: calendarComponent ]

	renderContentOn: html [
		html div
		    class: 'calendar';
		    with: calendarComponent.
		html text: 'SIDEBAR!'
	]
]

ObjectMemory snapshot: 'seaside.im'
