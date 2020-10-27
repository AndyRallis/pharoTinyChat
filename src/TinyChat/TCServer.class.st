Class {
	#name : #TCServer,
	#superclass : #Object,
	#instVars : [
		'teapotServer',
		'messageQueue'
	],
	#category : #'TinyChat-server'
}

{ #category : #public }
TCServer class >> startOn: aPortNumber [
	^ self new
		initializePort: aPortNumber;
		registerRoutes;
		registerErrorHandlers;
		yourself
]

{ #category : #registering }
TCServer class >> stopAll [
	self allInstancesDo: #stop
]

{ #category : #initialization }
TCServer >> initialize [ 
	super initialize.
	messageQueue := TCMessageQueue new
]

{ #category : #initialization }
TCServer >> initializePort: anInteger [
	teapotServer := Teapot configure: { 
		#defaultOutput -> #text.
		#port -> anInteger.
		#debugMode -> true
	 }.
	teapotServer start
]

{ #category : #initialization }
TCServer >> registerErrorHandlers [
	teapotServer 
		exception: KeyNotFound -> (TeaResponse notFound body: 'No such message')
]

{ #category : #initialization }
TCServer >> registerRoutes [
	teapotServer
		GET: '/messages/count' -> (Send message: #messageCount to: self);
		GET: '/messages/<id:IsInteger>' -> (Send message: #messagesFrom: to: self);
		POST: '/messages/add' -> (Send message: #addMessage: to: self)
]

{ #category : #accessing }
TCServer >> stop [ 
	teapotServer stop.
	messageQueue reset
]
