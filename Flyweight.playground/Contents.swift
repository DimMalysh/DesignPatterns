// A simple example of using the Flyweight template for a food processor.

enum Role : String {
    case blender = "Blender"
    case pressForCitrusFruits = "Press for citrus fruits"
    case knifeForChopper = "Knife for chopper"
    case largeGrater = "Large grater"
}

class FoodProcessor {
    let manufacturer: String
    let price: Int
    
    var role : Role?
    
    init(manufacturer: String, price: Int) {
        self.manufacturer = manufacturer
        self.price = price
    }
    
    func getInfo() -> String {
        return role != nil ? "Current role is \(role!.rawValue)." : "No role."
    }
}

let foodProcessor = FoodProcessor(manufacturer: "PHILIPS", price: 5000)
foodProcessor.getInfo()

foodProcessor.role = .blender
foodProcessor.getInfo()

foodProcessor.role = .knifeForChopper
foodProcessor.getInfo()