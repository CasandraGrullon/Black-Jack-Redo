//
//  main.swift
//  RedoBlackJack
//
//  Created by casandra grullon on 10/27/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

let game = Game()
game.newGame()
var gameOver = false

print("BLACK JACK!")

gameLoop: repeat {
    print("hit or pass?")
    let userResponse = readLine() ?? ""
    switch userResponse {
    case "hit" :
        game.hitMe(userResponse: userResponse)
        print(game.gameStatus(cards: game.player.cards))
    case "pass" :
        game.stopHits(userResponse: userResponse)
        break
    default :
        print("Try typing \'hit\' or \'pass\'")
    }
    switch gameOver {
    case true :
        print("Would you like to play again? \nyes or no?")
        let playAgain = readLine() ?? ""
        if playAgain == "yes" {
            game.newGame()
        } else {
            break
        }
    case false :
        continue gameLoop
    }
    
} while game.hasMoreCards

