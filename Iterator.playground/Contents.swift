// A simple example of using the Iterator template for an example with vending machines.

struct Chips {
    let name: String
}

enum Drinks {
    case Pepsi
    case Fanta
    case Sprite
}

let chipsAutomate = [Chips(name: "Lays"), Chips(name: "Pringels")]

// Iterator
for chip in chipsAutomate {
    print(chip.name)
}

let drinksAutomate = [Drinks.Fanta, Drinks.Pepsi, Drinks.Sprite]

// Iterator
for drink in drinksAutomate {
    print(drink)
}