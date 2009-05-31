
Seaside.WAComponent subclass: ClubRootComponent [
	| sideBarComponent tabView |

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
		tabView := ClubTabbedView new
		    addComponent: ClubNewsComponent new with: 'Recent News';
		    addComponent: ClubAdminComponent new with: 'Intern';
		    yourself.
	]

	children [
		^ Array with: sideBarComponent with: tabView
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
		            class: 'main';
		            with: tabView.
		        html div
			    class: 'sideBar';
		            with: sideBarComponent.]
	]
]

ClubRootComponent initialize.
ObjectMemory snapshot: 'seaside.im'

