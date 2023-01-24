//
//  main.swift
//  ex01
//
//  Created by Magnificent Edric on 8/12/22.
//

import Foundation

let card = Card(color: .Hearts, value: .Ace)
let card2 = Card(color: .Hearts, value: .Ace)
print(card.isEqual(to: card2))
print(card == card)
