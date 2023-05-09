//
//  Constant.swift
//  WeatherApp
//
//  Created by Ram on09/05/23.
//
import UIKit
enum Constant
{
    enum API {
        
        static let appIds = "e2c825a7602417faf1234265f3f8dc6b"
        static let weatherURL = "https://api.openweathermap.org/data/2.5/weather?"
        static let iconURL = "https://openweathermap.org/img/wn/"
    }
    enum Colors {
        static let backgroundColor = UIColor.init(red: 25 / 255, green: 195 / 255, blue: 251 / 255,alpha: 0.8)
    }
    enum PlaceHolder
    {
        static let windSpeed = "Wind speed"
        static let humidity = "Humidity"
        static let tempMin = "Min temperature"
        static let tempMax = "Max temperature"
        static let clouds = "Clouds"
    }
    enum Units
    {
        static let cel = "°C"
        static let miterPerSecond = "m/s"
        static let percentage = "%"
    }
    enum DataError:Error
    {
        case invalidResponse
        case invalidData
        case invalidURL
        case message(_error:Error?)
    }
    enum ParamKeys
    {
        case required
    }
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error)
    }
}
extension UserDefaults {
    static let group = UserDefaults(suiteName: "group.your.identifier")
}
