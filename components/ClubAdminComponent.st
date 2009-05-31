
ClubTabbedView subclass: ClubAdminComponent [
	
	initialize [
		super initialize.
	        self
		    setSideTabbed;
		    addComponent: (ClubUserComponent new)
				   "user: self session user;
				   yourself)"
		    with: 'Your Userpage';
		    addCallback: [self createNewEvent] with: 'Create New Event';
		    addCallback: [self createNewsItem] with: 'Create News'.
		components first value value. "Set Userpage View"
	]

	createNewEvent [
		| event |
		event := self call: ClubEvent new asComponent addValidatedForm.
		event ifNotNil: [self session database addEvent: event].
	]

	createNewsItem [
		| news |
		news := self call: ClubNewsitem new asComponent addValidatedForm.
	]
]

ObjectMemory snapshot: 'seaside.im'
