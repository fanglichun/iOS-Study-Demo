//: Playground - noun: a place where people can play

import UIKit
import Foundation


class Node<T> {
    
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node<T>) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            //text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "// equal to belows
            text += "{"
            for child in children {
                text += child.description + ","
            }
            text += "}"
        }
        return text
    }
}

extension Node where T: Equatable { //must confirm to  Equatable protocol,otherwise not use operator "=="
    
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

let beverages = Node(value: "beverages")//drink

let hotBeverages = Node(value: "hot")//hot drink
let coldBeverages = Node(value: "cold")//code drink

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)
let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")
hotBeverages.add(child: tea)
hotBeverages.add(child: coffee)
hotBeverages.add(child: cocoa)
let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")
tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)
let soda = Node(value: "soda")
let milk = Node(value: "milk")
let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")
soda.add(child: gingerAle)
soda.add(child: bitterLemon)
print(beverages)
beverages.search(value: "cocoa")?.description





public class TreeNode<T> {
    public var value: T
    
    public var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

let animal = TreeNode(value: "animal")//drink
let number = TreeNode(value: 5)
let number1 = TreeNode(value: 10)
number.addChild(number1)






