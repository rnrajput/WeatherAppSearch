//
//  WeatherSearchViewModel.swift
//  WeatherApp
//
//  Created by Ram on09/05/23.
//

import Foundation
import CoreLocation

class WeatherSearchViewModel
{
    var weatherSearchModel:WeatherSearchModel?
    var eventHandler:((_ event: Constant.Event) -> Void)?
    
    func searchWeatherBy(searchString:String)
    {
        self.eventHandler?(.loading)
        WeatherService.shared.searchWeather(searchParam: searchString) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let weatherSearchModel):
                print(weatherSearchModel)
                self.weatherSearchModel = weatherSearchModel
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
     
}
extension WeatherSearchViewModel
{
    func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
       let mf = MeasurementFormatter()
       mf.numberFormatter.maximumFractionDigits = 0
       mf.unitOptions = .providedUnit
       let input = Measurement(value: temp, unit: inputTempType)
       let output = input.converted(to: outputTempType)
       return mf.string(from: output)
     }
}


