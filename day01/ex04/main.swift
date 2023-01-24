//
//  main.swift
//  ex04
//
//  Created by Magnificent Edric on 8/12/22.
//

import Foundation

let array = Deck(viewCard: false)
print(array)

if let card1 = array.draw() {
    print(card1)
    array.fold(c: card1)
    print(array.discards)
    print(array.outs)
} else {
    print("card is nil")
}

