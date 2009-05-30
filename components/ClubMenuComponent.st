
Seaside.WAComponent subclass: ClubMenuComponent [
	| entries |
	
	initialize [ 
		super initialize.
		entries := OrderedCollection new.
	]

	renderContentOn: html [
		html div
		    class: 'menuItems';
		    with: [
		        entries do: [:each |
		            html anchor
			        callback: each value;
		                with: each key]
		        separatedBy: [html space]]
	]

	addEntry: aString with: aBlock [
		^ entries add: (aString -> aBlock)
	]
]

ObjectMemory snapshot: 'seaside.im'
