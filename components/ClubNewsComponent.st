
Seaside.WAComponent subclass: ClubNewsComponent [
	| limit sortBlock |
	
	initialize [ 
	    super initialize.
	    sortBlock := [:x :y | true ].
	    limit := 10.
	]

	limit: aNumber [ limit := aNumber ]
	sortBlock: aBlock [ sortBlock := aBlock ]

	renderNewsItem: aNewsItem on: html [
		html div
		    class: 'newsTitle';
		    with: [html text: aNewsItem title].
		html div
		    class: 'newsDate';
		    with: [html text: aNewsItem date asString].
		html div
		    class: 'newsContent';
		    with: [html text: aNewsItem content].

		"self session isLoggedIn
		    ifTrue: [html div
		        class: 'newsEdit';
			with: [html anchor
			    callback: [self editNewsItem: aNewsItem]
			    with: [html text: 'Edit']]]"
	]

	renderContentOn: html [
		html div
		    class: 'news';
		    with: [
			html text: 'Recent News'.
			(self session database news) do: [:news | 
		             self renderNewsItem: news on: html]
		    ]
	]
]

ObjectMemory snapshot: 'seaside.im'
