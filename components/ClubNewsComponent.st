
Seaside.WAComponent subclass: ClubNewsComponent [
	| eventEditor menuComponent |
	
	initialize [ 
		super initialize.
		eventEditor := ClubEventEditor new.
	        menuComponent := ClubMenuComponent new.

		self initializeMenuComponent.
	]

	initializeMenuComponent [
		menuComponent separator: #break.
		menuComponent addEntry: 'Link1' with: [self call: eventEditor].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Link3' with: [].
	]

	children [ ^ Array with: eventEditor with: menuComponent ]

	renderContentOn: html [
		html div
		    class: 'subNav';
		    with: menuComponent.
		html div
		    class: 'mainContent';
		    with: [
		        html heading: 'NEWS!'.
		        self session database events do: [:each |
		            html text: each title]
		        separatedBy: [html break]]
	]
]

ObjectMemory snapshot: 'seaside.im'
