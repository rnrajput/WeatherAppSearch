//
//  WeatherRowLayout.swift
//  WeatherApp
//
//  Created by Ram on 09/05/23.
//

import UIKit

class WeatherRowLayout: UITableViewCell {
    
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMinValue: UILabel!
    
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMaxValue: UILabel!
    
    @IBOutlet weak var cloudsLbl: UILabel!
    @IBOutlet weak var cloudsValue: UILabel!
    
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
extension WeatherRowLayout
{
    func weatherDataConfiguration()
    {
        guard let model else {
            return
        }
        tempMin.text = Constant.PlaceHolder.tempMin
        
        let minTempValue = model.main.temp_min ?? 0.0
        let minCel = (minTempValue - 273.15)
        self.tempMinValue.text = String(format: "%.0f %@", minCel,Constant.Units.cel)
        
        tempMax.text = Constant.PlaceHolder.tempMax
        let maxTempValue = model.main.temp_max ?? 0.0
        let maxCel = (maxTempValue - 273.15)
        self.tempMaxValue.text = String(format: "%.0f %@", maxCel,Constant.Units.cel)
    }
}
