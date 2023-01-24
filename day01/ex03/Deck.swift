//
//  Deck.swift
//  ex03
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

extension Array {
    static func mix(card array: [Card])->[Card] {
        var mixArray = array
        for i in 0..<array.count{
            let valIndex = Int(arc4random_uniform(UInt32(array.count - 1)))
            let tmpVal = mixArray[i]
            mixArray[i] = mixArray[valIndex]
            mixArray[valIndex] = tmpVal
        }
        return mixArray
    }
}
