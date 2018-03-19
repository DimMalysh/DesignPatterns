// A simple example of using the Bridge pattern to separate the Carnivora class abstraction and implementation. 

enum Domains {
    case eukaryotes
    case bacteria
    case archaea
}

enum TypesOfAnimals {
    case protozoa
    case chord
    case arthropods
}

class Carnivora {
    let kingdom : String = "Animals"
    let domain : Domains
    let type : TypesOfAnimals
    var description : String
    
    init(domain : Domains, type : TypesOfAnimals, description : String) {
        self.domain = domain
        self.type = type
        self.description = description
    }
}

class Fissipedia : Carnivora {
    
}

class Pinnipedia : Carnivora {
    
}

class Tiger : Carnivora {

}

class Walrus : Pinnipedia {

}

//Bridge
//*** abstraction
protocol NewCarnivora {
    var kingdom : String {get}
    var domain : Domains {get}
    var type : TypesOfAnimals {get}
}

class NewFissipedia: NewCarnivora {
    var kingdom : String
    var domain : Domains
    var type : TypesOfAnimals
    
    init(domain : Domains, kingdom : String, type : TypesOfAnimals) {
        self.domain = domain
        self.kingdom = kingdom
        self.type = type
    }
}

class NewPinnipedia: NewCarnivora {
    var kingdom : String
    var domain : Domains
    var type : TypesOfAnimals
    
    init(domain : Domains, kingdom : String, type : TypesOfAnimals) {
        self.domain = domain
        self.kingdom = kingdom
        self.type = type
    }
}
// ***

//*** implementation
protocol Description {
    var animal: NewCarnivora {get}
    var description: String {get}
}

class NewTiger: Description {
    var animal: NewCarnivora
    var description: String
    
    init(animal: NewCarnivora, description: String) {
        self.animal = animal
        self.description = description
    }
}

class NewWalrus: Description {
    var animal: NewCarnivora
    var description: String
    
    init(animal: NewCarnivora, description: String) {
        self.animal = animal
        self.description = description
    }
}
// ***

let newTiger = NewTiger(animal: NewPinnipedia(domain : Domains.eukaryotes, kingdom : "Animals", type : TypesOfAnimals.chord), description: "New tiger with fins.")
let newWalrus = NewWalrus(animal: NewFissipedia(domain : Domains.eukaryotes, kingdom : "Animals", type : TypesOfAnimals.chord), description: "New walrus with paws.")
