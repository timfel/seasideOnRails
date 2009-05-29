
Seaside.WAFileLibrary subclass: ClubFileLibrary [
	
	selectorsToInclude [
		^ Array new
	]
]

ClubFileLibrary addAllFilesIn: '/home/tim/GST-Seaside/scripts/../static/'.


ObjectMemory snapshot: 'seaside.im'
