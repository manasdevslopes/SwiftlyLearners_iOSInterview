import Foundation

// Getter : - A getter is a method that returns the current value of a property.
// Setter : - A setter is a method that sets the value of a property.

class TemperatureConverter {
  // Stored property with a custom getter and setter
  private var _celsius: Double = 0.0
  
  // Getter is same as computed property, eg below
  //  var celsius: Double {
  //   return _celsius
  //  }
  
  var celsius: Double {
    get {
      print("Getting temperature in Celsius: \(_celsius)")
      return _celsius
    }
    set {
      print("Setting temperature in Celsius to \(newValue)")
      _celsius = newValue
    }
  }
  
  // Computed property with a custom getter
  var fahrenheit: Double {
    get {
      print("Converting Celsius to Fahrenheit")
      return (_celsius * 9/5) + 32
    }
  }
}

let temperatureConverter = TemperatureConverter()

// Accessing the 'celsius' property invokes the custom getter
let currentTemperatureInCelsius = temperatureConverter.celsius

// Setting the 'celsius' property invokes the custom setter
temperatureConverter.celsius = 25.0

// Accessing the 'fahrenheit' property invokes the custom getter
let currentTemperatureInFahrenheit = temperatureConverter.fahrenheit
