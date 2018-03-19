// A simple example of using the pattern Chain of responsibility for a conveyor that processes various items that are on it: toys, electronics and others.

protocol BasicItem {
    var nextItem: BasicItem? {get}
    func handleItem(_ item: BasicItem?)
}

class Toy : BasicItem {
    var nextItem: BasicItem?
    func handleItem(_ item: BasicItem?) {
        item is Toy ? print("Toy found. Handling...") : self.nextItem!.handleItem(nextItem)
    }
}

class Electronics : BasicItem {
    var nextItem: BasicItem?
    func handleItem(_ item: BasicItem?) {
        item is Electronics ? print("Electronics found. Handling...") : self.nextItem!.handleItem(nextItem)
    }
}

class Trash : BasicItem {
    var nextItem: BasicItem?
    func handleItem(_ item: BasicItem?) {
       print("Found undefined item. Destroying!")
    }
}

let toy = Toy()
let electronic = Electronics()
let trash = Trash()

toy.nextItem = electronic
electronic.nextItem = trash
trash.nextItem = nil

toy.handleItem(toy)
toy.handleItem(electronic)
toy.handleItem(trash)

electronic.handleItem(nil)
electronic.handleItem(toy)
electronic.handleItem(electronic)
electronic.handleItem(trash)