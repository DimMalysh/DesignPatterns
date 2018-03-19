// A simple example of using the Composite pattern, which allows the client to access individual tanks and tank groups identically.

protocol Unit {
    func getStrength() -> Int
}

class LightTank : Unit {
    func getStrength() -> Int {
        return 1
    }
}

class MediumTank : Unit {
    func getStrength() -> Int {
        return 2
    }
}

class WeakenedMediumTank : MediumTank {
    override func getStrength() -> Int {
        return 1
    }
}

class StrongedMediumTank : MediumTank {
    override func getStrength() -> Int {
        return 3
    }
}

class HeavyTank : Unit {
    func getStrength() -> Int {
        return 3
    }
}

//Composite
class Army: Unit {
    var units = [Unit]()
    
    init(units: [Unit]) {
        self.units = units
    }
    
    func getStrength() -> Int {
        var totalStrength = 0
        for unit in units {
            totalStrength += unit.getStrength()
        }
        return totalStrength
    }
}

let myLightTanks: [Unit] = Array(repeating: LightTank(), count: 300)
let myHeavyTanks: [Unit] = Array(repeating: HeavyTank(), count: 100)
let myArmy = Army(units: myLightTanks + myHeavyTanks)
let myStrength = myArmy.getStrength()

let enemyMediumTanks: [Unit] = Array(repeating: MediumTank(), count: 200)
let enemyWeakenedMediumTanks: [Unit] = Array(repeating: WeakenedMediumTank(), count: 100)
let enemyStrongedMediumTanks: [Unit] = Array(repeating: StrongedMediumTank(), count: 50)
let enemyArmy = Army(units: enemyMediumTanks + enemyWeakenedMediumTanks + enemyStrongedMediumTanks)
let enemyStrength = enemyArmy.getStrength()

switch (myStrength, enemyStrength) {
case _ where myStrength > enemyStrength: print("My army won!")
case _ where myStrength < enemyStrength: print("The enemy's army won!")
default: print("Cheeses are equal! Draw.")
}