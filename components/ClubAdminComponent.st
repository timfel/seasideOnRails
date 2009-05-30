
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
		menuComponent addEntry: 'Create News' with: [self createNewsItem].
		menuComponent addEntry: 'Link3' with: [].
	]

	createNewEvent [
		| event |
		event := self call: ClubEvent new asComponent addValidatedForm.
		event ifNotNil: [self session database addEvent: event].
	]

	createNewsItem [
		| news |
		news := self call: ClubNewsitem new asComponent addValidatedForm.
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
