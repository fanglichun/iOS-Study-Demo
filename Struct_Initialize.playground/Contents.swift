//: Playground - noun: a place where people can play

import UIKit
import Foundation


struct RocketConfiguration {
    let names = "Michael"
    let numberOfFirstStageCores = 3
    let numberOfSecondStageCores = 1
    var numberOfStageReuseLandingLegs: Int?
    
}

let athena9Heavy = RocketConfiguration()
//print(athena9Heavy)

struct RocketStageConfiguration {
    
    let propellantMass: Double
    let liquidOxygenMass: Double
    let nominalBurnTime: Int
    
}

extension RocketStageConfiguration {
    init(propellantMass: Double, liquidOxygenMass: Double) {
        self.propellantMass = propellantMass
        self.liquidOxygenMass = liquidOxygenMass
        nominalBurnTime = 180
    }
}

let stageOneConfiguration = RocketStageConfiguration(propellantMass: 119.1, liquidOxygenMass: 276.0)
let stageOneConfiguration1 = RocketStageConfiguration(propellantMass: 119.1,
                                                      liquidOxygenMass: 276.0,
                                                      nominalBurnTime: 190)
//print(stageOneConfiguration)
//print(stageOneConfiguration1)

struct Weather {
    
    let temperatureCelsius: Double
    let windSpeedKilometersPerHour: Double
    
    //    init(temperatureFahrenheit: Double, windSpeedKilometersPerHour: Double) {
    //        self.temperatureCelsius = (temperatureFahrenheit - 32 ) / 1.8
    //        self.windSpeedKilometersPerHour = windSpeedKilometersPerHour * 1.609344
    //    }
    
    init(temperatureFahrenheit: Double = 72, windSpeedKilometersPerHour: Double = 5) {
        self.temperatureCelsius = (temperatureFahrenheit - 32 ) / 1.8
        self.windSpeedKilometersPerHour = windSpeedKilometersPerHour * 1.609344
    }
    
}

let currentDefaultWeather = Weather()
//print(currentDefaultWeather.temperatureCelsius)
//print(currentDefaultWeather.windSpeedKilometersPerHour)
let currentWeather = Weather(temperatureFahrenheit: 87, windSpeedKilometersPerHour: 2)
//print(currentWeather.temperatureCelsius)
//print(currentWeather.windSpeedKilometersPerHour)


struct GuidanceSensorStatus {
    var currentZAngularVelocityRadiansPerMinute: Double
    let initialZAngularVelocityRadiansPerMinute: Double
    var needsCorrection: Bool
    
    init(zAngularVelocityDegreesPerMinute: Double, needsCorrection: Bool = false) {
        let radiansPerMinute = zAngularVelocityDegreesPerMinute * 0.01745329251994
        self.currentZAngularVelocityRadiansPerMinute = radiansPerMinute
        self.initialZAngularVelocityRadiansPerMinute = radiansPerMinute
        self.needsCorrection = needsCorrection
    }
    
    init(zAngularVelocityDegreesPerMinute: Double, needsCorrection: Int) {
        //        let radiansPerMinute = zAngularVelocityDegreesPerMinute * 0.01745329251994
        //        self.currentZAngularVelocityRadiansPerMinute = radiansPerMinute
        //        self.initialZAngularVelocityRadiansPerMinute = radiansPerMinute
        //        self.needsCorrection = needsCorrection > 0
        self.init(zAngularVelocityDegreesPerMinute: zAngularVelocityDegreesPerMinute,
                  needsCorrection: (needsCorrection > 0))
    }
    
}

let guidanceStatus1 = GuidanceSensorStatus(zAngularVelocityDegreesPerMinute: 2.2, needsCorrection: 0)
//print(guidanceStatus1.currentZAngularVelocityRadiansPerMinute)
//print(guidanceStatus1.needsCorrection)


struct CombustionChamberStatus {
    var temperatureKelvin: Double
    var pressureKiloPascals: Double
    
    init(temperatureKelvin: Double, pressureKiloPascals: Double) {
        print("Phase 1 init")
        self.temperatureKelvin = temperatureKelvin
        self.pressureKiloPascals = pressureKiloPascals
        print("CombustionChamberStatus fully initialized")
        print("Phase 2 init")
    }
    
    init(temperatureCelsius: Double, pressureAtmospheric: Double) {
        print("Phase 1 delegating init")
        let temperatureKelvin = temperatureCelsius + 273.15
        let pressureKiloPascals = pressureAtmospheric * 101.325
        self.init(temperatureKelvin: temperatureKelvin, pressureKiloPascals: pressureKiloPascals)
        print("Phase 2 delegating init")
    }
}

print(CombustionChamberStatus(temperatureCelsius: 32, pressureAtmospheric: 0.96))







struct TankStatus {
    
    var currentVolumn: Double
    var currentLiquidType: String?
    
    init?(currentVolumn: Double, currentLiquidType: String?) {
        
        if currentVolumn < 0 {
            return nil
        }
        if currentVolumn > 0 && currentLiquidType == nil {
            return nil
        }
        
        self.currentVolumn = currentVolumn
        self.currentLiquidType = currentLiquidType
        
    }
}

let tankStatus = TankStatus(currentVolumn: 0.0, currentLiquidType: nil)
if let tankStatus = TankStatus(currentVolumn: 0.0, currentLiquidType: nil) {
    print("Nice, tank status created.") // Printed!
} else {
    print("Oh no, an initialization failure occurred.")
}

if let tankStatus = TankStatus(currentVolumn: -10, currentLiquidType: nil) {
    print("Nice, tank status created.") // Printed!
    
} else {
    print("Oh no, an initialization failure occurred.")
    
}

// an astronaut should have a non-empty String for his or her name property and should have an age ranging from 18 to 70
struct Astronaut {
    
    let name: String
    let age: Int
    
    init(name: String, age: Int) throws {
        
        if name.isEmpty {
            throw InvalidAstronautDataError.EmptyName
        }
        if age < 18 || age > 70 {
            throw InvalidAstronautDataError.invalidAge
        }
        self.name = name
        self.age = age
    }
}

enum InvalidAstronautDataError: Error {
    
    case EmptyName
    case invalidAge
    
}

let john = try? Astronaut(name: "John Li", age: 17)
print(john)






















