
Seaside.WAComponent subclass: ClubRootComponent [
	| sideBarComponent newsComponent adminComponent menuComponent |

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
		newsComponent := ClubNewsComponent new.	
		menuComponent := ClubMenuComponent new.

		self initializeMenuComponent.
	]

	initializeMenuComponent [
		menuComponent addEntry: 'Link1' with: [].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Link3' with: [].
	]

	children [
		^ Array 
		    with: sideBarComponent
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
		            class: 'main';
		            with: newsComponent.
		        html div
			    class: 'sideBar';
		            with: sideBarComponent.]
	]
]

ClubRootComponent initialize.
ObjectMemory snapshot: 'seaside.im'

