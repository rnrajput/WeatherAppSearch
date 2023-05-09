//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Ram on09/05/23.
//

import Foundation
typealias Handler = (Result<WeatherSearchModel,Constant.DataError>) -> Void
class WeatherService
{
    static let shared = WeatherService()
    //protect object creation outside of class only access with shared
    private init() {
        
    }
    func searchWeather(searchParam:String,completion: @escaping Handler)
    {
        let searchString = Constant.API.weatherURL + "q=\(searchParam)" + "&" + "appid=\(Constant.API.appIds)"
        guard let url = URL(string: searchString) else {
            completion(.failure(.invalidURL))
          return
        }
        URLSession.shared.dataTask(with: url){ data,response,error in
            guard let data,error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            //json decoder data convert to model(array)
            do {
                let weatherSearchModel = try JSONDecoder().decode(WeatherSearchModel.self, from: data)
                completion(.success(weatherSearchModel))
            }
            catch {
                completion(.failure(.message(_error: error)))
            }
        }.resume()
    }
}

