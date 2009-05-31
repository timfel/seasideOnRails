Seaside.WASession subclass: ClubSession [
	| database user |
	
	initialize [
		super initialize.
		database := ClubDatabase new.
		user := nil.
		self stubInitialize.
	]

	stubInitialize [
		self database addUser: (ClubUser new 
		      username: 'test';
		      joinYear: 2007;
		      photo: 'none';
		      description: 'keine beschreibung';
		      addDetail: 'E-Mail' with: 'testmail';
		      yourself).
		self login: self database users first.
	]

	database [ ^ database ]

	isLoggedIn [ ^ user isNil not ]
	login: aClubUser [ user := aClubUser ]
	logout [ user := nil ]
	username [ ^ user username ]
	user [ ^ user ]
]

ObjectMemory snapshot: 'seaside.im'
