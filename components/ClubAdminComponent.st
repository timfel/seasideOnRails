
Seaside.WAComponent subclass: ClubAdminComponent [
	| eventEditor menuComponent |
	
	initialize [ 
		super initialize.
		eventEditor := ClubEventEditor new.
	        menuComponent := ClubMenuComponent new.

		self initializeMenuComponent.
	]

	initializeMenuComponent [
		menuComponent separator: #break.
		menuComponent addEntry: 'Create New Event' with: [self createNewEvent].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Link3' with: [].
	]

	createNewEvent [
		| event |
		event := self call: eventEditor.
		event ifNotNil: [self session database addEvent: event].
	]

	children [ ^ Array with: eventEditor with: menuComponent ]

	renderContentOn: html [
		html div
		    class: 'subNav';
		    with: menuComponent.
		html div
		    class: 'mainContent';
		    with: [ html heading: 'ADMIN!' ].
	]
]

ObjectMemory snapshot: 'seaside.im'
