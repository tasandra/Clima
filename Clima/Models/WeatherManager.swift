//
//  WeatherManager.swift
//  Clima
//
//  Created by Alexandra Tarasova on 5/4/21.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherMaganer: WeatherManager,  weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7c5d671a523deaf9cee896c81249645a&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let urlSting = "\(weatherURL)&q=\(cityName.replacingOccurrences(of: " ", with: "+"))"
        performRequest(with: urlSting)

    }
    
    func fetchWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlSting = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlSting)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeDate = data{
                    if let weather = self.parseJSON(safeDate) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
