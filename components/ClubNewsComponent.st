
Seaside.WAComponent subclass: ClubNewsComponent [
	| eventEditor |
	
	initialize [ 
		super initialize.
		eventEditor := ClubEventEditor new.
	]

	children [ ^ Array with: eventEditor ]

	eventEditor [ ^ eventEditor ]

	renderContentOn: html [
		html heading: 'NEWS!'.
		self session database events do: [:each |
		    html text: each title]
		separatedBy: [html break]
	]
]

ObjectMemory snapshot: 'seaside.im'
