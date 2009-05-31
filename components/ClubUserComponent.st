
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
		with: [html text: 'Semester: '.
		       html text: DateTime now year 
			- user joinYear * 2 + 1 
			- (1 - (DateTime now month / 12) 
			      asFloat roundTo: 1) asInteger].
	    html div 
	        class: 'userPhoto';
		with: [html image: user photo].
	    html div
	        class: 'userDetails';
		with: [user details keysAndValuesDo: [:key :value|
			html text: (key,': ',value)]].
	    html div 
	        class: 'userDescription';
		with: [html html: 'Beschreibung: ',user description].
	]
]

ObjectMemory snapshot: 'seaside.im'
