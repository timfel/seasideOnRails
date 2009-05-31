
Seaside.WAComponent subclass: ClubUserComponent [
	| user |
	
	initialize [ super initialize ]

	user [ ^ user ]
	user: aClubUser [ user := aClubUser ]

	renderContentOn: html [
	    html div 
	        class: 'userName';
		with: [html text: user username].
	    html div 
	        class: 'userSemestre';
		with: [html text: DateTime now year 
			- user joinYear * 2 + 1 
			- (1 - (DateTime now month / 12) 
			      asFloat roundTo: 1) asInteger].
	    html div 
	        class: 'userPhoto';
		with: [html image: user photo].
	    html div
	        class: 'userDetails';
		with: [user details do: [:each |
			html text: (each key,': ',each value)]]
	    html div 
	        class: 'userDescription';
		with: [html html: user description].
	]
]

ObjectMemory snapshot: 'seaside.im'
