//
//  SearchLocationVC.swift
//  WeatherApp
//
//  Created by Ram on09/05/23.
//

import UIKit
import CoreLocation

class SearchLocationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var weatherSearchViewModel = {
        WeatherSearchViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initDesign()
        self.initViewModel(searchText: "USA")
    }
    func initDesign()
    {
        self.searchView.tintColor = .black
        self.searchView.barStyle = .default
        self.view.backgroundColor = Constant.Colors.backgroundColor
        self.searchView.backgroundColor = Constant.Colors.backgroundColor
        self.searchView.barTintColor =  Constant.Colors.backgroundColor
        self.tableView.backgroundColor = Constant.Colors.backgroundColor
        searchView.searchTextField.textColor = .white
        searchView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        let textField = self.searchView.value(forKey: "searchField") as! UITextField
        textField.tintColor = UIColor.white
        
    }
    func initViewModel(searchText:String) {
        self.searchView.text = searchText
        weatherSearchViewModel.searchWeatherBy(searchString: searchText)
        // Reload TableView closure
        weatherSearchViewModel.eventHandler = {arug1 in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
extension SearchLocationVC: UISearchBarDelegate
{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchView.showsCancelButton = true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let userText = searchBar.text
        if userText?.isEmpty == false
        {
            //Call API here
            initViewModel(searchText: userText!)
        }
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}

extension SearchLocationVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherRowLayout", for: indexPath) as! WeatherRowLayout
        cell.model =  weatherSearchViewModel.weatherSearchModel
        cell.weatherDataConfiguration()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        240
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherHeaderLayout") as! WeatherHeaderLayout
        cell.model =  weatherSearchViewModel.weatherSearchModel
        cell.weatherDataConfiguration()
        return cell
    }
}
extension SearchLocationVC
{
    func alertMessage(message:String,buttonText:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title: "Location", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}
