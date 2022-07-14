Class {
	#name : #GraphQLClient,
	#superclass : #Object,
	#instVars : [
		'znclient',
		'queryVariables',
		'queryBody',
		'graphqlEndpoint'
	],
	#category : #GraphQLSupport
}

{ #category : #GraphQL }
GraphQLClient >> executeQuery [
	"Execute the given GraphQL operation at the given endpoint"
	"scope: class-variables  &  instance-variables"	
	
  |requestDict res output|

  requestDict := Dictionary new.
  requestDict at: 'query' put: (self operationBody). 
  
  (self operationVariables) ifNotNil: [ 
	requestDict at: 'variables' put: (self operationVariables).
  ]. 

  self znclient forJsonREST.
  res := self znclient post: (self graphqlEndpoint) contents: requestDict.

  (res at: 'errors') ifNotNil: [ 
	output := OperationResult new.
	output wasSuccess: false.
	output result: (res at: 'errors').
  ].

  (res at: 'data') ifNotNil: [ 
	output := OperationResult new.
	output wasSuccess: true.
	output result: (res at: 'data').
  ].
  ^ output.
]

{ #category : #accessing }
GraphQLClient >> graphqlEndpoint [

	^ graphqlEndpoint
]

{ #category : #GraphQL }
GraphQLClient >> graphqlEndpoint: anObject [

   "Set the URL the GraphQL endpoint is"
	graphqlEndpoint := anObject
]

{ #category : #accessing }
GraphQLClient >> operationBody [

	^ queryBody
]

{ #category : #GraphQL }
GraphQLClient >> operationBody: anObject [
   "set the body of the operation - be that query or mutation. This should be a string object."

	queryBody := anObject
]

{ #category : #accessing }
GraphQLClient >> operationVariables [

	^ queryVariables
]

{ #category : #GraphQL }
GraphQLClient >> operationVariables: anObject [
   "set the variables for the operation. This should be a Dictionary object"

	queryVariables := anObject
]

{ #category : #accessing }
GraphQLClient >> znclient [
  znclient ifNil: [ 
	znclient := ZnClient new.
  ]. 
	
	^ znclient
]
