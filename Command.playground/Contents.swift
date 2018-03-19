// A simple example of using the Command pattern to turn the device on and off.

enum SomeDevice {
    case laptop
    case tv
    case iPhone
    case iPad
}

protocol Command {
    func execute() -> String
}

class OnCommand: Command {
    let device: SomeDevice
    
    init(_ device: SomeDevice) {
        self.device = device
    }
    
    func execute() -> String {
        return "Turn on \(device)"
    }
}

class OffCommand: Command {
    let device: SomeDevice
    
    init(_ device: SomeDevice) {
        self.device = device
    }
    
    func execute() -> String {
        return "Turn off \(device)"
    }
}

class Device {
    let onCommand: Command
    let offCommand: Command
    
    init(_ device: SomeDevice) {
        self.onCommand = OnCommand(device)
        self.offCommand = OffCommand(device)
    }
    
    func on() -> String {
        return onCommand.execute()
    }
    
    func off() -> String {
        return offCommand.execute()
    }
}

let laptop = Device(.laptop)
laptop.on()
laptop.off()