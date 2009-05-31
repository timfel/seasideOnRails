
Seaside.WAFileLibrary subclass: ClubFileLibrary [
	
	mainCss [
		^ '
.mainWrapper {
   border-style: solid;
   border-width: 1px;
   width: 800px;
   margin-left: auto;
   margin-right: auto;
}

.mainHead {
   border-style: solid;
   border-width: 2px;
   height: 120px;
}

.mainNav {
   height: 24px;
   border-style: double;
   border-width: 4px;
}

.subNav {
   width: 140px;
   float: right;
   font-color: #dedede;
   font-size: small;
   border: 1px dashed silver;
}

.calendar {
   border-style: solid;
   border-width: 4px;
   width: 140px;
   height: 140px;
   margin-left: auto;
   margin-right: auto;
}

.sideBar {
   border-style: solid;
   border-width: 1px;
   width: 158px;
   float: left;
}

.main {
   border-style: solid;
   border-width: 1px;
   width: 638px;
   float: right;
}'
	]
	
	selectorsToInclude [
		^ Array with: 'mainCss'
	]
]

"ClubFileLibrary addAllFilesIn: '/home/tim/GST-Seaside/scripts/../static/'."

ObjectMemory snapshot: 'seaside.im'
