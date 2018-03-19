// A simple example of using the Proxy template to create objects for a person and his deputy is a clone.

protocol Human {
    func move() -> String
}

class Person: Human {
    func move() -> String {
        return "I am moving"
    }
}

//Proxy
class Clone: Human {
    let owner: Human
    
    init(owner: Human) {
        self.owner = owner
    }
    
    func move() -> String {
        return "I am moving"
    }
}

let somePerson = Person()
let cloneOfSomePerson = Clone(owner: somePerson)
cloneOfSomePerson.move()