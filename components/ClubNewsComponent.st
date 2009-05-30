
Seaside.WAComponent subclass: ClubNewsComponent [
	
	initialize [ 
		super initialize.
	]

	renderContentOn: html [
		html heading: 'NEWS!'.
		self session database events do: [:each |
		    html text: each title]
	]
]

ObjectMemory snapshot: 'seaside.im'
