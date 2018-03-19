// A simple example of using the Mediator template to create a smart home.

class SmartHousePart {
    var centrallProcessor: CentrallProcessor? = nil
    
    init(centrallProcessor: CentrallProcessor) {
        self.centrallProcessor = centrallProcessor
    }
    
    func numbersChanged() {
        centrallProcessor?.valueChanged(aPart: self)
    }
}

class CentrallProcessor {
    var thermometer: Thermometer? = nil
    var conditioningSystem: ConditioningSystem? = nil
    
    func valueChanged(aPart: SmartHousePart) {
        print("Value changed! We need to do smth!")
        if aPart is Thermometer {
            print("Oh, the change is temperature.")
            self.conditioningSystem?.startCondition()
        }
    }
}

class Thermometer : SmartHousePart {
    var temperature = 0
    func temperatureChanged(_ temperature: Int) {
        self.temperature = temperature
        self.numbersChanged()
    }
}

class ConditioningSystem : SmartHousePart {
    func startCondition() {
        print("Conditioning...")
    }
}

let centrallProcessor = CentrallProcessor()
let thermometer = Thermometer(centrallProcessor: centrallProcessor)
let conditioningSystem = ConditioningSystem(centrallProcessor: centrallProcessor)

centrallProcessor.conditioningSystem = conditioningSystem
centrallProcessor.thermometer = thermometer
thermometer.temperatureChanged(45)