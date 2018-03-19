// Simple example to use the pattern Adapter for adapting european measure of length from american measure.

protocol MeasureOfLength {
    var kilometer: Double {get}
}

class  EuropeanMeasureOfLength : MeasureOfLength {
    var kilometer : Double
    
    init(kilometer : Double) {
        self.kilometer = kilometer
    }
}

class AmericanMeasureOfLength {
    var mile : Double
    
    init(mile : Double) {
        self.mile = mile
    }
}

// Adapter
class Adapter: MeasureOfLength {
    private let target: AmericanMeasureOfLength
    
    var kilometer: Double {
        return target.mile * 1.60934
    }
    
    init(target: AmericanMeasureOfLength) {
        self.target = target
    }
}

let km = EuropeanMeasureOfLength(kilometer: 5)

let mi = AmericanMeasureOfLength(mile: 2)
let adaptedMi = EuropeanMeasureOfLength(kilometer: Adapter(target: mi).kilometer)