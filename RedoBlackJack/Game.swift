//
//  game.swift
//  RedoBlackJack
//
//  Created by casandra grullon on 10/27/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

class Game {
    var deck = [Card]()
    var player = Player()
    var hitPlayer = false
    
    var hasMoreCards : Bool {
        return !deck.isEmpty
    }
    
    var randomComputerScore : Int {
        return Int.random(in: 18...21)
    }
    
    
    func newGame() {
        deck = Card.newDeck(aceValue: 1)
        player = Player(score: 0, cards: [Card](), playerName: "")
    }
    
    func stopHits(userResponse: String) {
        if userResponse == "pass" {
            print("computer score: \(computerVPlayer())")
            if computerVPlayer() > player.score {
            print("Your score was lower! You lost!")
                print("Your score: \(player.score)")
            } else if computerVPlayer() < player.score {
                print("Your score was higher! You won!")
                print("Your score: \(player.score)")
            } else {
                print("Its a tie!")
            }
            
            gameOver = true
        }
        
    }
    
    func hitMe(userResponse: String) {
        if userResponse == "hit" {
            //remove card from deck
            deck = deck.shuffled()
            if let hitcard = deck.popLast() {
                player.cards.append(hitcard)
                player.score += hitcard.value
            }
            let playerHand = player.cards.map { (card) -> String in
                card.stringify()
            }
            print("your hand: \(playerHand)")
            print("your score: \(player.score)")
        }
    }
    
    func computerVPlayer() -> Int {
        let computerScore = randomComputerScore
        return computerScore
    }
    
    func gameStatus(cards: [Card]) -> Int {
        if player.score == 21 {
            print("Black Jack! You won!")
            gameOver = true
        } else if player.score < 21 {
            print("hit or pass?")
            gameOver = false
        } else if player.score > 21 {
            print("BUST! You lost")
            gameOver = true
        }else {
            print("hit or pass?")
            gameOver = false
        }
        return player.score
    }
    
    
    
    
    
    
    
    //ends class
}

