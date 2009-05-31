
Seaside.WAComponent subclass: ClubTabbedView [
	"Container-Component to create tabbed views"
	| components currentComponent tabType |

	initialize [ 
	    super initialize.
	    components := OrderedCollection new.
	    self setTopTabbed.
	]

	components [ ^ components ]
	addComponent: aComponent with: aString [
	    ^ components add: (aString -> [currentComponent := aComponent])
   	]

	addCallback: aBlock with: aString [
	    ^ components add: (aString -> aBlock)
   	]

	setTopTabbed [ tabType := 'mainNav' ]
	setSideTabbed [ tabType := 'subNav' ]

	separatorOn: html [
	    tabType = 'mainNav'
	        ifTrue: [ ^ html space ]
		ifFalse: [ ^ html break ]
	]

	renderTabsOn: html [
	    html div
	        class: tabType;
		with: [
	            components do: [:each |
			html anchor
		    	    callback: each value;
		    	    with: each key]
	   	    separatedBy: [self separatorOn: html]]
	]

	renderContentOn: html [
	    self renderTabsOn: html.
	    currentComponent ifNotNil: [
	    	html div
		    class: 'mainContent';
	    	    with: currentComponent]
	]
]

ObjectMemory snapshot: 'seaside.im'
