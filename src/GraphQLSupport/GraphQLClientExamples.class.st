Class {
	#name : #GraphQLClientExamples,
	#superclass : #Object,
	#category : #GraphQLSupport
}

{ #category : #'as yet unclassified' }
GraphQLClientExamples class >> simpleCustomOperationResult [

	<gtExample>
	| q res |
	q := GraphQLClient new.
	q znclient setBearerAuthentication: KindaSecret githubAuth.

	q graphqlEndpoint: 'https://api.github.com/graphql'.
	q operationBody: 'query {
	     viewer {
	       repositories(last: 10) {
	          nodes { 
	             name
	             url
	             createdAt
	           }
	       }
       }
     }'.

	res := GithubRepositoryBrowserOperationResult newFromOperationResult: q executeQuery.
	^ res repositoryNames
]

{ #category : #'as yet unclassified' }
GraphQLClientExamples class >> simpleQuery [

	<gtExample>
	| q res output |
	q := GraphQLClient new.
	q znclient setBearerAuthentication: KindaSecret githubAuth.

	q graphqlEndpoint: 'https://api.github.com/graphql'.
	q operationBody: 'query { 
	  viewer { 
	       login
	  } 
	}	
	'.

	res := q executeQuery.

	res errors ifNotNil: [ output := res result at: 1 ].
	res data ifNotNil: [ output := res result ].
	
	^ output
]
