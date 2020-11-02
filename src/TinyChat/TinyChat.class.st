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

{ #category : #accessing }
TinyChat >> cmdLastMessageID [
	^ self command: '/messages/count'
]

{ #category : #accessing }
TinyChat >> cmdNewMessage [
	^ self command: '/messages/add'
]

{ #category : #accessing }
TinyChat >> command: aPath [
	^ '{1}{2}' format: { url . aPath }
]

{ #category : #accessing }
TinyChat >> command: aPath argument: anArgument [
	^ '{1}{2}/' format: { url . aPath . anArgument asString }
]

{ #category : #initialization }
TinyChat >> initialize [ 
	super initialize.
	exit := false.
	lastMessageIndex := 0.
	messages := OrderedCollection new
]

{ #category : #accessing }
TinyChat >> mdMessagesFromLastIndexToEnd [
"Returns the server messages from my current last index to thelast one on the server."
	^ self command: '/messages' argument: lastMessageIndex 
]
