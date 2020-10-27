Class {
	#name : #TinyChat,
	#superclass : #Object,
	#instVars : [
		'url',
		'login',
		'exit',
		'messages',
		'console',
		'lastMessageIndex'
	],
	#category : #'TinyChat-clients'
}

{ #category : #initialization }
TinyChat >> initialize [ 
	super initialize.
	exit := false.
	lastMessageIndex := 0.
	messages := OrderedCollection new
]
