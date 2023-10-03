Class {
	#name : #GuessTheWordGame,
	#superclass : #Object,
	#instVars : [
		'secretWord',
		'guessedWord',
		'maxAttempts',
		'attemptsLef',
		'wordList'
	],
	#category : #GuessTheWord
}

{ #category : #'as yet unclassified' }
GuessTheWordGame >> guessLetter: aLetter [
	| feedback | 
	attemptsLef > 0 ifTrue: [ 
		attemptsLef := attemptsLef - 1.
		guessedWord := guessedWord, aLetter.
		feedback := secretWord select: [ :each | guessedWord includes: each ] thenCollect: [ :each | each ifTrue: [ each ] ifFalse: [ '_' ] ].
      feedback := feedback asSortedCollection.
      feedback := feedback asString.
		feedback displayAt: 100@100.
		^ feedback.
	] ifFalse: [ 
		^ 'Game Over. The word was: ', secretWord. 
	].
]

{ #category : #initialization }
GuessTheWordGame >> initialize [ 
	wordList := #('apple', 'banana', 'cherry', 'grape', 'orange').
	secretWord := wordList atRandom.
	maxAttempts := secretWord size * 2.
	attemptsLef := maxAttempts.
	guessedWord := ''.
]
