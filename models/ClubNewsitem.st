
Object subclass: ClubNewsitem [
	| id title date content event |

	ClubNewsitem class >> descriptionDate [
		^ Seaside.Magritte.MADateDescription new
		    selectorAccessor: #date;
		    label: 'Datum';
		    priority: 1;
		    beReadonly;
		    default: Date today;
		    yourself
	]

	ClubNewsitem class >> descriptionTitle [
		^ Seaside.Magritte.MAStringDescription new
		    selectorAccessor: #title;
		    label: 'Newstitel';
		    priority: 2;
		    addCondition: [:value | value size > 5]
		        labelled: 'Titel zu kurz!';
		    yourself
	]

	ClubNewsitem class >> descriptionContent [
		^ Seaside.Magritte.MAMemoDescription new
		    selectorAccessor: #content;
		    label: 'Inhalt';
		    addCondition: [:value | value size > 5]
		        labelled: 'Inhalt zu kurz!';
		    priority: 3;
		    yourself
	]

	ClubNewsitem class >> descriptionEvent [
		| events |
		events := ClubDatabase new events collect: [:event | event title].
		^ Seaside.Magritte.MASingleOptionDescription new
		    selectorAccessor: #event;
		    label: 'Event';
		    options: (events add: 'DUMB'; yourself); "FIXME!"
		    default: events first;
		    yourself
	]

	initialize [ super initialize ]

	title [ ^ title ]
	title: aString [ ^ title := aString ]
	date [ ^ date ]
	date: aDate [ ^ date := aDate ]
	content [ ^ content ]
	content: aString [ ^ content := aString ]
	event [ ^ event ]
	event: aString [ ^ event := aString ]
]

ObjectMemory snapshot: 'seaside.im'
