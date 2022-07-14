"
This is an example OperationResult subclass
"
Class {
	#name : #GithubRepositoryBrowserOperationResult,
	#superclass : #OperationResult,
	#category : #GraphQLSupport
}

{ #category : #'as yet unclassified' }
GithubRepositoryBrowserOperationResult >> repositoryNames [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

   |repositories output|
   output := OrderedCollection new.

   repositories := (self data at: 'viewer' at: 'repositories') at: 'nodes'.

  output := repositories collect: [ :current |
	current name
	].
  
	^ output.
]
