//
//  WeatherHeaderLayout.swift
//  WeatherApp
//
//  Created by Ram on 09/05/23.
//

import UIKit
import Kingfisher

class WeatherHeaderLayout: UITableViewCell {
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windSpeedValue: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    
    var weatherSearchViewModel: WeatherSearchViewModel?
    
    var model:WeatherSearchModel? {
        //property observer
        didSet {
            weatherDataConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
extension WeatherHeaderLayout
{
    func weatherDataConfiguration()
    {
        guard let model else {
            return
        }
        self.img.setImage(iconName: model.weather[0].icon ?? "")
        let temp = model.main.temp ?? 0.0
        let temperatureInCelsius = (temp - 273.15)
        
        self.tempLbl.text = String(format: "%.0f %@", temperatureInCelsius,Constant.Units.cel)
        let main = model.weather[0].main
        self.mainLbl.text = main
        
        self.windSpeedLbl.text = Constant.PlaceHolder.windSpeed
        self.windSpeedValue.text = String(format: "%.0f %@", model.wind.speed ?? 0.0,Constant.Units.miterPerSecond)
        
        self.humidityLbl.text = Constant.PlaceHolder.humidity
        self.humidityValue.text = String(format: "%.0f %@", model.main.humidity ?? 0.0,Constant.Units.percentage)
    }
}
extension UIImageView
{
    func setImage(iconName:String)
    {
        let iconPathString = Constant.API.iconURL + iconName + "@2x.png"
        guard let url = URL.init(string: iconPathString)
        else {
            return
        }
        let rersource = ImageResource(downloadURL: url,cacheKey: iconPathString)
        kf.indicatorType = .activity
        kf.setImage(with: rersource)
    }
}
