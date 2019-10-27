//
//  Card.swift
//  RedoBlackJack
//
//  Created by casandra grullon on 10/27/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct Card {
  var suit: Suit
  var value: Int
  var isFaceCard: Bool
  var face: FaceCard?
  
  func stringify() -> String {
    var cardStr = ""
    if self.isFaceCard {
      cardStr += self.face?.rawValue ?? "🤣"
    } else {
      cardStr += self.value.description
    }
    cardStr += self.suit.rawValue
    return cardStr
  }
  
  static func newDeck(aceValue: Int) -> [Card] {
    var cards = [Card]()
    for cardValue in 2..<11 {
      for suit in Suit.allCases {
        let card = Card(suit: suit, value: cardValue, isFaceCard: false)
        cards.append(card)
      }
    }
    for face in FaceCard.allCases {
      for suit in Suit.allCases {
        let card = Card(suit: suit, value: 10, isFaceCard: true, face: face)
        cards.append(card)
      }
    }
    for suit in Suit.allCases {
      let card = Card(suit: suit, value: aceValue, isFaceCard: false)
      cards.append(card)
    }
    return cards
  }
}
