
Object subclass: ClubUser [
	| username password details joinYear photo description |

	ClubUser class >> descriptionUsername [
		^ MAStringDescription
		    selectorAccessor: #username;
		    label: 'Voller Name';
		    priority: 1;
		    addCondition: [:value | value size > 5]
		        labelled: 'Ausweis bitte, diesen Namen glaub ich nicht!';
		    addCondition: [:value | value includesSubString: ' ']
		        labelled: 'Vor- und Zunamen bitte durch Leerzeichen getrennt!';
		    yourself
	]

	username [ ^ username ]
	username: aString [ username := aString ]
	password [ ^ password ]
	password: aString [ password := aString ]
	details [ ^ details ]
	joinYear [ ^ joinYear ]
	joinYear: aYear [ joinYear := aYear ]
	photo [ ^ photo ]
	photo: aBitmap [ photo := aBitmap ]
	description [ ^ description ]
	description: aString [ description := aString ]

	addDetail: aKey with: aString [ details add: (aKey -> aString) ]
		    
	initialize [ 
		super initialize.
		details := Dictionary new.
	]
]

ObjectMemory snapshot: 'seaside.im'
