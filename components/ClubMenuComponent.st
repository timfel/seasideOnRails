
Seaside.WAComponent subclass: ClubMenuComponent [
	| entries separator |
	
	initialize [ 
		super initialize.
		entries := OrderedCollection new.
		separator := #space.
	]

	separator: aHtmlMethod [ ^ separator := aHtmlMethod ]

	renderContentOn: html [
		html div
		    class: 'menuItems';
		    with: [
		        entries do: [:each |
		            html anchor
			        callback: each value;
		                with: each key]
		        separatedBy: [html perform: separator]]
	]

	addEntry: aString with: aBlock [
		^ entries add: (aString -> aBlock)
	]
]

ObjectMemory snapshot: 'seaside.im'
