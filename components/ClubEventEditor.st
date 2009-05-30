
Seaside.WAComponent subclass: ClubEventEditor [
	| event |
	
	initialize [ 
		super initialize.
		event := nil.
	]

	event [ ^ event ]
	event: anEvent [ ^ event := anEvent ]

	renderContentOn: html [
		event ifNil: [ event := ClubEvent new ].
		html div
		    class: 'mainContent';
		    with: [
		        html heading: 'Editing task'.
		            html form: [
				html table: [
				    html
					tableRow: [self renderNameInputOn: html];
					tableRow: [self renderDateInputOn: html];
					tableRow: [self renderButtonsOn: html]]]].
	]

	renderNameInputOn: html [
		html
		    tableData: [html text: 'Event-Titel: '];
		    tableData: [html textInput on: #title of: self event]
	]

	renderDateInputOn: html [
		html
		    tableData: [html text: 'Event-Datum: '];
		    tableData: [html dateInput on: #date of: self event]
	]

	renderButtonsOn: html [
		html
		    tableData: [
			html submitButton
			    callback: [self answer: event];
			    value: 'Speichern'.
			html submitButton
			    callback: [self answer: nil];
			    value: 'Abbrechen']
	]
]

ObjectMemory snapshot: 'seaside.im'
