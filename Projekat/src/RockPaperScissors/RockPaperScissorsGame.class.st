Class {
	#name : #RockPaperScissorsGame,
	#superclass : #Object,
	#instVars : [
		'playerChoice',
		'comupterChoice',
		'choices'
	],
	#category : #RockPaperScissors
}

{ #category : #initialization }
RockPaperScissorsGame >> announceWinner [ [ 
	^ '', self calculateWinner.
]
]

{ #category : #initialization }
RockPaperScissorsGame >> calculateWinner [ [
	 (playerChoice = 'Rock' and: [comupterChoice = 'Scissors'])
            ifTrue: [^ 'Player wins!'].
        (playerChoice = 'Scissors' and: [comupterChoice = 'Paper'])
            ifTrue: [^ 'Player wins!'].
        (playerChoice = 'Paper' and: [comupterChoice = 'Rock'])
            ifTrue: [^ 'Player wins!'].
        
        (comupterChoice = 'Rock' and: [playerChoice = 'Scissors'])
            ifTrue: [^ 'Computer wins!'].
        (comupterChoice = 'Scissors' and: [playerChoice = 'Paper'])
            ifTrue: [^ 'Computer wins!'].
        (comupterChoice = 'Paper' and: [playerChoice = 'Rock'])
            ifTrue: [^ 'Computer wins!'].
        
        ^ 'Its a tie!'
]
]

{ #category : #initialization }
RockPaperScissorsGame >> determineWinner [ [ 
	| result |
	result := playerChoice, 'vs', comupterChoice, ':', (self annouceWinner).
	^ result, (self announceWinner).
]
]

{ #category : #initialization }
RockPaperScissorsGame >> initialize [ [ 
	choices := #('Rock' 'Paper' 'Scissors').
]
]

{ #category : #actions }
RockPaperScissorsGame >> play [
[  
	playerChoice := playerChoice capitalized.
	comupterChoice := choices atRandom.
	
	^ self determineWinner.
]
]
