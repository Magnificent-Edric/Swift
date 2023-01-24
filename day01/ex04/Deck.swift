//
//  Deck.swift
//  ex04
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
    
    var cards = [Card]()
    var discards = [Card]()
    var outs = [Card]()
    
    init(viewCard: Bool){
        cards = viewCard ? Deck.allCards : Array<Card>.mix(card: Deck.allCards)
    }
    
    override var description: String{
        let array = cards.map{$0.description}
        return array.joined(separator: " ")
    }
    
    func draw() -> Card?{
        let cardDraw: Card?
        if cards.count > 0{
            cardDraw = cards.removeFirst()
            outs.append(cardDraw!)
            return cardDraw
        }else{
            return nil
        }
    }
    func fold(c: Card){
        if let outIndex = outs.firstIndex(of: c) {
            discards.append(c)
            outs.remove(at: outIndex)
        }
    }
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
