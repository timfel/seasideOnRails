
Seaside.WAComponent subclass: ClubEventComponent [
	| tabView event |
	
	ClubEventComponent class >> new: aClubEvent [
		^ self new
		    event: aClubEvent;
		    yourself
	]

	event [ ^ event ]
	event: aClubEvent [ event := aClubEvent ]

	initialize [ 
		super initialize.
	        tabView := ClubTabbedView new
		    setSideTabbed;
		    addComponent: ClubEventOverviewComponent new with: 'Overview';
		    addComponent: (ClubListView new: (self session database news)) with: 'Associated News';
		    addComponent: (ClubListView new: (self session database users)) with: 'Supervisors';
		    addComponent: ClubParticipantsComponent new with: 'Participants';
		    addComponent: ClubTimetableComponent new with: 'Timetable';
		    addComponent: (ClubListView new: (event repositories)) new with: 'Repositories';
		    addComponent: ClubFeedbackComponent new with: 'Feedback';
		    yourself.
	]

	renderContentOn: html [
		html div
		    class: 'mainContent';
		    with: [
		        html heading: 'NEWS!'.
		        self session database events do: [:each |
		            html text: each title]
		        separatedBy: [html break]]
	]
]

ObjectMemory snapshot: 'seaside.im'
