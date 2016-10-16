//: Playground - noun: a place where people can play

import UIKit

class Cat {
    var name = "Tom"
}

class Miller { //the class that we need to extend
    
}

private var catKey = "cat Key"
extension Miller {
    var cat: Cat? {
        get {
            /**
             * Returns the value associated with a given object for a given key.
             *
             * @param object The source object for the association.
             * @param key The key for the association.
             *
             * @return The value associated with the key \e key for \e object.
             * 
             * @see objc_setAssociatedObject
             */
            return objc_getAssociatedObject(self, &catKey) as? Cat
            
        }
        set {
            /**
             * Sets an associated value for a given object using a given key and association policy.
             *
             * @param object The source object for the association.
             * @param key The key for the association.
             * @param value The value to associate with the key key for object. Pass nil to clear an existing association.
             * @param policy The policy for the association. For possible values, see “Associative Object Behaviors.”
             *
             * @see objc_setAssociatedObject
             * @see objc_removeAssociatedObjects
             */
            objc_setAssociatedObject(self, &catKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            //OBJC_ASSOCIATION_RETAIN stand for attribute modified,eg: Double type use OBJC_ASSOCIATION_ASSIGN, String type use OBJC_ASSOCIATION_COPY_NONATOMIC and so on
        }
    }
}

let miller = Miller()
print(miller.cat)
miller.cat = Cat()
if let name = miller.cat?.name {
    print(name)
}






