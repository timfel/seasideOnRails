
Object subclass: ClubEvent [
	| id title date participants supervisors repositories photos newsItems |

	ClubEvent class >> descriptionTitle [
		^ Seaside.Magritte.MAStringDescription new
		    selectorAccessor: #title;
		    label: 'Event Titel';
		    priority: 1;
		    addCondition: [:value | value size > 5]
		        labelled: 'Event Titel sollte wohl länger sein, gell?';
		    yourself
	]

	ClubEvent class >> descriptionDate [
		^ Seaside.Magritte.MADateDescription new
		    selectorAccessor: #date;
		    label: 'Event Datum';
		    priority: 2;
		    addCondition: [:value | value > Date today]
		        labelled: 'Doch nicht heute!?';
		    default: Date today;
		    yourself
	]

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
