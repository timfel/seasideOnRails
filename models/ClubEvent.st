
Object subclass: ClubEvent [
	| title date participants supervisors repositories photos newsItems |

	initialize [
		super initialize.
	        title := ''.
		date := DateTime now.
	        participants := supervisors := repositories := photos := OrderedCollection new
	]

	title [ ^ title ]
	title: aString [ ^ title := aString ]

	date [ ^ date ]
	date: aDateTime [ ^ date := aDateTime ]
]

ObjectMemory snapshot: 'seaside.im'
