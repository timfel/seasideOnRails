
Seaside.WAComponent subclass: ClubRootComponent [
	| sideBarComponent menuComponent currentComponent
	  newsComponent loginComponent |

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
		currentComponent := newsComponent := ClubNewsComponent new.	
		loginComponent := ClubAdminComponent new.	
		menuComponent := ClubMenuComponent new.

		self initializeMenuComponent.
	]

	initializeMenuComponent [
		menuComponent addEntry: 'News' with: [currentComponent := newsComponent].
		menuComponent addEntry: 'Link2' with: [].
		menuComponent addEntry: 'Intern' with: [currentComponent := loginComponent].
	]

	children [
		^ Array 
		    with: sideBarComponent
		    with: newsComponent
		    with: menuComponent
		    with: loginComponent
	]

	renderLogonInformationOn: html [
		self session isLoggedIn
		    ifTrue: [
		        html text: 'Logged in as ', self session username.
			html anchor
			    callback: [self logout];
			    with: [html text: '(Logout)']]
		    ifFalse: [html text: 'Not logged in']
	]

	renderContentOn: html [
		self renderLogonInformationOn: html.
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
		            with: currentComponent.
		        html div
			    class: 'sideBar';
		            with: sideBarComponent.]
	]
]

ClubRootComponent initialize.
ObjectMemory snapshot: 'seaside.im'

