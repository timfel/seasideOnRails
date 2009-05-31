
Seaside.WAComponent subclass: ClubSideBarComponent [
	| calendarComponent newsComponent |

	initialize [ 
		super initialize.
	        calendarComponent := ClubCalendarComponent new.
		newsComponent := ClubNewsComponent new.
		newsComponent 
		    limit: 5;
		    sortBlock: [:news | true ]
	]

	children [ ^ Array with: calendarComponent with: newsComponent ]

	renderContentOn: html [
		html div
		    class: 'calendar';
		    with: calendarComponent.
		html div
		    class: 'newsFeed';
		    with: newsComponent.
	]
]

ObjectMemory snapshot: 'seaside.im'
