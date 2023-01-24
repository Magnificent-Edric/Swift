//
//  Card.swift
//  ex01
//
//  Created by Magnificent Edric on 8/12/22.
//

import Foundation

class Card: NSObject{
    
    var color : Color
    var value : Value
    
    init(color c: Color, value v : Value){
        self.color = c
        self.value = v
        super.init()
    }
    
    override var description: String {
        return "\(value.rawValue), \(color.rawValue)"
    }
    
    override func isEqual(to object: Any?) -> Bool {
        if let objectOther = object as? Card{
            return color == objectOther.color && value == objectOther.value
        }
        return false
    }
    
    static func ==(left: Card, right: Card) -> Bool {
        left.isEqual(to: right)
    }
}
