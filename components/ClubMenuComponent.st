
Seaside.WAComponent subclass: ClubMenuComponent [
	| entries |
	
	initialize [ 
		super initialize.
		entries := OrderedCollection new.
	]

	renderContentOn: html [
		entries do: [:each |
		    html div
		        class: 'menu-item';
		        with: [html anchor
			    callback: each value;
		            with: each key]
		] separatedBy: [html space].
	]

	addEntry: aString with: aBlock [
		^ entries add: (aString -> aBlock)
	]
]

ObjectMemory snapshot: 'seaside.im'
