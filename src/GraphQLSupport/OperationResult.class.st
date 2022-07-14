"
An OperationResult encapsulates the result from the GraphQL operation. You can use it directly OR, if you have complex object traversal needs, you can subclass it for your particular needs (either object traversal needs OR display needs)
"
Class {
	#name : #OperationResult,
	#superclass : #Object,
	#instVars : [
		'wasSuccess',
		'result'
	],
	#category : #GraphQLSupport
}

{ #category : #'instance creation' }
OperationResult class >> newFromOperationResult: oldResult [
	"Construct a new instance of (this class) from another OperationResult subclass.
	
	Meant to allow OperationResults to be up-casted into specific OperationResult subclasses"
	"scope: class-variables  &  class-instance-variables"	
	|o|
	
   o := self new.
   o result: (oldResult result).
   o wasSuccess: (oldResult wasSuccess).

  ^ o.
]

{ #category : #accessing }
OperationResult >> data [
  ^ wasSuccess ifTrue: [ result ] ifFalse: [ nil ].
]

{ #category : #accessing }
OperationResult >> errors [
  ^ wasSuccess ifFalse: [ result ] ifTrue: [ nil ]. 
]

{ #category : #accessing }
OperationResult >> result [

	^ result
]

{ #category : #accessing }
OperationResult >> result: anObject [

	result := anObject
]

{ #category : #accessing }
OperationResult >> wasSuccess [

	^ wasSuccess
]

{ #category : #accessing }
OperationResult >> wasSuccess: anObject [

	wasSuccess := anObject
]
