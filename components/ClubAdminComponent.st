
ClubTabbedView subclass: ClubAdminComponent [
	
	initialize [
		super initialize.
	        self
		    setSideTabbed;
		    addComponent: (ClubUserComponent new
				   user: self session user;
				   yourself)
		    with: 'Your Userpage';
		    addCallback: [self createNewEvent] with: 'Create New Event';
		    addCallback: [self createNewsItem] with: 'Create News'.
		components first value value. "Set Userpage View"
	]

	createNewEvent [
		| event |
		event := currentComponent call: ClubEvent new asComponent addValidatedForm.
		event ifNotNil: [self session database addEvent: event].
	]

	createNewsItem [
		| news |
		news := currentComponent call: ClubNewsitem new asComponent addValidatedForm.
		news ifNotNil: [self session database addNews: news].
	]
]

ObjectMemory snapshot: 'seaside.im'
