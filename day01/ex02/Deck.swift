//
//  Deck.swift
//  ex02
//
//  Created by Magnificent Edric on 8/12/22.
//

import Foundation

class Deck: NSObject{
    static let allSpades = Value.allValue.map{Card(color: Color.Spades, value: $0)}
    static let allDiamonds = Value.allValue.map{Card(color: Color.Diamonds, value: $0)}
    static let allHearts = Value.allValue.map{Card(color: Color.Hearts, value: $0)}
    static let allClubs = Value.allValue.map{Card(color: Color.Clubs, value: $0)}
    
    static let allCards = allSpades + allDiamonds + allHearts + allClubs
}
