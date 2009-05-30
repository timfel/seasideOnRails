
Seaside.WAComponent subclass: ClubNewsComponent [
	| menuComponent |
	
	initialize [ 
		super initialize.
	        menuComponent := ClubMenuComponent new.

		self initializeMenuComponent.
	]

	initializeMenuComponent [
		menuComponent separator: #break.
		menuComponent addEntry: 'Link1' with: [].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Link3' with: [].
	]

	children [ ^ Array with: menuComponent ]

	renderNewsItem: aNewsItem on: html [
		html div
		    class: 'newsTitle';
		    with: [html text: aNewsItem title].
		html div
		    class: 'newsDate';
		    with: [html text: aNewsItem date asString].
		html div
		    class: 'newsContent';
		    with: [html text: aNewsItem content].

		self session isLoggedIn
		    ifTrue: [html div
		        class: 'newsEdit';
			with: [html anchor
			    callback: [self editNewsItem: aNewsItem]
			    with: [html text: 'Edit']]]
	]

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
