
ClubTabbedView subclass: ClubAdminComponent [
	
	initialize [
		super initialize.
	        self
		    setSideTabbed;
		    addComponent: (ClubUserComponent new
				   user: self session user;
				   yourself)
		    with: 'Your Userpage';
		    addCallback: [self create: ClubEvent andAddWith: #addEvent:] with: 'Create New Event';
		    addCallback: [self create: ClubNewsitem andAddWith: #addNews:] with: 'Create News'.
		components first value value. "Set Userpage View"
	]

	children [ ^ Array with: myChildren first with: currentComponent ]

	create: aModel andAddWith: aSymbol [
		| model |
		currentComponent := aModel new asComponent addValidatedForm.
		currentComponent onAnswer: [:answer | 
			model := answer.
			model ifNotNil: [self session database perform: aSymbol with: model].
			currentComponent := components first value value]
	]
]

ObjectMemory snapshot: 'seaside.im'
