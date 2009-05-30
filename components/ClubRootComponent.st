
Seaside.WAComponent subclass: ClubRootComponent [
	| sideBarComponent menuComponent newsComponent |

	ClubRootComponent class >> canBeRoot [ ^ true ]
	ClubRootComponent class >> initialize [
        	| application |
        	application := self registerAsApplication: self name asString.
        	application preferenceAt: #sessionClass put: ClubSession.
		application preferenceAt: #libraries put: (Array with: ClubFileLibrary with: Seaside.WAStandardFiles).
	]

	initialize [ 
		super initialize.
	        sideBarComponent := ClubSideBarComponent new.
	        menuComponent := ClubMenuComponent new.
		newsComponent := ClubNewsComponent new.	

		self initializeMenuComponent.
	]

	newsComponent [ ^ newsComponent ]
	
	initializeMenuComponent [
		menuComponent addEntry: 'New Event' with: [self newsComponent call: self newsComponent eventEditor].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Link3' with: [].
	]

	children [
		^ Array 
		    with: sideBarComponent
		    with: menuComponent
		    with: newsComponent
	]

	renderContentOn: html [
		html div
		    class: 'mainWrapper';
		    with: [
		        html div
		            class: 'mainHead';
		            with: [html text: 'BANNER'].
		        html div
		            class: 'mainNav';
		            with: menuComponent.
		        html div
		            class: 'mainContent';
			    with: [
		                html div
				    class: 'sideBar';
		                    with: sideBarComponent.
		                html div
		                    class: 'main';
		                    with: newsComponent.]]
	]
]

ClubRootComponent initialize.
ObjectMemory snapshot: 'seaside.im'

