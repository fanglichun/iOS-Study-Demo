//
//  SolarSystem.swift
//  Science
//
//  Created by flc on 2017/10/7.
//  Copyright © 2017年 Michael. All rights reserved.
//

import UIKit

class SolarSystem: NSObject {
    
    let sun = Star(name: "Sun", color: UIColor.orange)
    
    
    let mercury = Planet(name: "Mervury", color: UIColor.black)
    let venus = Planet(name: "Venus", color: UIColor.yellow)
    let earth = Planet(name: "Earth", color: UIColor.blue)
    let mars = Planet(name: "Mars", color: UIColor.red)
    let jupiter = Planet(name: "Jupiter", color: UIColor.brown)
    let saturn = Planet(name: "Saturn", color: UIColor.clear)
    let uranus = Planet(name: "Uranus", color: UIColor.cyan)
    let neptune = Planet(name: "Neptune", color: UIColor.darkGray)
    
    let planets: [Planet]
    
    public override init() {
        planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
        var s = "Hello!"
        for c in s.characters { print(c)}
        print(s.characters.last == "!")
//        print(s.characters.index(of: "!") )
        for c in s {
            print(c)
        }
        s.last == "!"
        s.index(of: "!")
        s.dropLast(1) + " World"
        let poem = """
        ’Twas brillig, and the slithy toves
        Did gyre and gimble in the wabe:
        All mimsy were the borogoves,
        And the mome raths outgrabe.
        """
    }
    
}
