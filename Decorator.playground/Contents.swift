// A simple example of using the Decorator template to extend the functionality of an object without defining subclasses.

protocol Cookie {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCookie : Cookie {
    func getCost() -> Double {
        return 10.0
    }
    
    func getIngredients() -> String {
        return "Flour, Sugar, Eggs, Baking Powder"
    }
}

// Decorator
class CookieDecorator : Cookie {
    private let decoratedCookie: Cookie
    let separatorOfIngredients = ", "
    
    required init(decoratedCookie: Cookie) {
        self.decoratedCookie = decoratedCookie
    }
    
    func getCost() -> Double {
        return decoratedCookie.getCost()
    }
    
    func getIngredients() -> String {
        return decoratedCookie.getIngredients()
    }
}

class Chocolate : CookieDecorator {
    required init(decoratedCookie: Cookie) {
        super.init(decoratedCookie: decoratedCookie)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 5
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + separatorOfIngredients + "Chocolate"
    }
}

var cookie: Cookie = SimpleCookie()
cookie.getCost()
cookie.getIngredients()

cookie = Chocolate(decoratedCookie: cookie)
cookie.getCost()
cookie.getIngredients()