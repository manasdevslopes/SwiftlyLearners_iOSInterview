import Foundation

// willSet: This observer is called just before the value of the property is set. It provides the opportunity to take some action before the new value is assigned.
// didSet: This observer is called immediately after the value of the property is set. It allows you to respond to the change that just occurred.

class Temperature {
  var celsius: Double = 0 {
    willSet {
      print("About to set the \(celsius) temperature to \(newValue) degrees Celsius")
    }
    didSet {
      if celsius > oldValue {
        print("Temperature increased from \(oldValue) to \(celsius) degrees Celsius")
      } else if celsius < oldValue {
        print("Temperature decreased from \(oldValue) to \(celsius) degrees Celsius")
      } else {
        print("Temperature remains the same at \(celsius) degrees Celsius")
      }
    }
  }
}

let temperatureMonitor = Temperature()

// Setting the temperature triggers the property observers
temperatureMonitor.celsius = 25.0
temperatureMonitor.celsius = 20.0
temperatureMonitor.celsius = 20.0
temperatureMonitor.celsius = 25.0



struct Temperature1 {
  var celsius: Double {
    willSet {
      print("About to set the \(celsius) temperature to \(newValue) degrees Celsius")
    }
    didSet {
      if celsius > oldValue {
        print("Temperature increased from \(oldValue) to \(celsius) degrees Celsius")
      } else if celsius < oldValue {
        print("Temperature decreased from \(oldValue) to \(celsius) degrees Celsius")
      } else {
        print("Temperature remains the same at \(celsius) degrees Celsius")
      }
    }
  }
  
  // Mutating method to update temperature in Fahrenheit
  mutating func updateTemperatureInFahrenheit(_ fahrenheit: Double) {
    celsius = (fahrenheit - 32) * 5/9
  }
}

var temperatureMonitor1 = Temperature1(celsius: 20.0)
// Setting the temperature triggers the property observers
temperatureMonitor1.celsius = 25.0

// Using the mutating method to update temperature in Fahrenheit
temperatureMonitor1.updateTemperatureInFahrenheit(77.0)
