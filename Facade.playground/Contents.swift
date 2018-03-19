// A simple example of using the Facade template to create one common point of interaction (SushiServices class) between subsystems (OrderDepartment, DeliveryDepartment and DiscountDepartment classes).

class OrderDepartment {
    func getPrice(count: Int) -> Double {
        return Double(count * 75)
    }
}

class DeliveryDepartment {
    func getTimeDelivery(address: String) -> Int {
        return address == "KrivoyRog" ? 60 : 120
    }
}

class DiscountDepartment {
    func getDiscount(count: Int) -> Double {
        switch count {
        case 1...3: return 0
        case 4...10: return 10
        default: return 20
        }
    }
}

class SushiServices {
    let discount: DiscountDepartment
    let order: OrderDepartment
    let delivery: DeliveryDepartment
    
    init(discount: DiscountDepartment, order: OrderDepartment, delivery: DeliveryDepartment) {
        self.delivery = delivery
        self.discount = discount
        self.order = order
    }
    
    func getInfo(count: Int, address: String) -> (Double, Int) {
        let regularPrice = order.getPrice(count: count)
        let discountPrice = discount.getDiscount(count: count)
        let price = regularPrice - regularPrice * discountPrice / 100
        let timeDelivery = delivery.getTimeDelivery(address: address)
        return (price, timeDelivery)
    }
}

let callCenter = SushiServices(discount: DiscountDepartment(), order: OrderDepartment(), delivery: DeliveryDepartment())

let someClient = callCenter.getInfo(count:5, address: "KrivoyRog")
let anotherClient = callCenter.getInfo(count:10, address: "Gluhomanovka")