
Seaside.WAComponent subclass: ClubListView [
	| itemBlock |

	ClubListView class >> new: aBlock [
		^ self new
		    itemBlock: aBlock;
		    yourself
	]
	
	itemBlock: aBlock [ itemBlock := aBlock ]
	itemBlock [ ^ itemBlock ]

	initialize [ super initialize ]

	renderItem: aModelInstance on: html [
		"This misuses Magritte's descriptions to decide what to render"
		| renderVariables  |
		renderVariables := ((aModelInstance class class methodDictionary keys 
		    select: [:key | key asString startsWith: 'description'])
			collect: [:method | (aModelInstance class perform: method)])
			    asSortedCollection.
		renderVariables sortBlock: [:x :y | x priority < y priority].
		(renderVariables collect: [:each | each accessor selector]) do: [:each |
		    html 
			text: ((aModelInstance perform: each) asString);
			break]
	]

	renderContentOn: html [
		itemBlock value do: [:item |
		    html div
		        class: 'listItem';
			with: [self renderItem: item on: html]
		]
	]
]

ObjectMemory snapshot: 'seaside.im'
