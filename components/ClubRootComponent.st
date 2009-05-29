
Seaside.WAComponent subclass: ClubRootComponent [
	| sideBarComponent menuComponent newsComponent |

	ClubRootComponent class >> canBeRoot [ ^ true ]
	ClubRootComponent class >> initialize [
        	| application |
        	application := self registerAsApplication: self asString.
        	application preferenceAt: #sessionClass put: ClubSession.
	]

	
	initialize [ 
		super initialize.
	        sideBarComponent := ClubSideBarComponent new.
	        menuComponent := ClubMenuComponent new.
		newsComponent := ClubNewsComponent new.	

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
		    with: menuComponent
		    with: newsComponent
	]

	renderContentOn: html [
		html div
		    class: 'menu';
		    with: menuComponent.
		html div
		    class: 'sideBar';
		    with: sideBarComponent.
		html div
		    class: 'main';
		    with: newsComponent.
	]
]

ObjectMemory snapshot: 'seaside.im'

