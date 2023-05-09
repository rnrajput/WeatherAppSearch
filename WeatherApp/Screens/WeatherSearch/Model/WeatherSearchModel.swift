//
//  WeatherSearchModel.swift
//  WeatherApp
//
//  Created by Ram on09/05/23.
//

import Foundation

struct WeatherSearchModel:Decodable
{
    var base : String
    var visibility : Int
    var dt : Int
    var timezone : Int
    var id : Int
    var name : String
    var cod : Int
    
    var coord: Coord
    var weather: [Weather]
    var main: Main
    var wind: Wind
    var clouds: Clouds
    var sys: Sys
}
struct Coord: Decodable
{
    var lon : Double
    var lat : Double
}
struct Weather: Decodable
{
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?
}
struct Main: Decodable
{
    var temp : Double?
    var feels_like : Double?
    var temp_min : Float?
    var temp_max : Float?
    var pressure : Int?
    var humidity : Int?
    var sea_level : Int?
    var grnd_level : Int?
    var temp_kf: Float?
}
struct Wind: Decodable
{
    var speed :Float?
    var deg : Int?
    var gust : Float?
}
struct Clouds: Decodable
{
    var all: Int?
}
struct Sys: Decodable
{
    var type: Int?
    var id: Int?
    var country : String
    var sunrise : Int64
    var sunset : Int64
}

