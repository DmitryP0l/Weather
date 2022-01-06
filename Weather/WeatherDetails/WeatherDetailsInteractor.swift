//
//  WeatherDetailsInteractor.swift
//  Weather
//
//  Created by lion on 3.01.22.
//

import Foundation

final class WeatherDetailsInteractor: NSObject {
    weak var vc: WeatherDetailsVC?
    
    let dataSource: [DailyWeatherCellModel] =
    [DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "2", tempMaxString: "20"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10"),
     DailyWeatherCellModel(dateString: "day", tempMinString: "1", tempMaxString: "10")
    ]
}

//final class DailyWeatherDetailsInteractor: NSObject {
//
//    let dataSource: [DailyWeatherDetailsViewModel] = [ DailyWeatherDetailsViewModel(weatherImage: <#T##UIImage#>, backgroungImage: <#T##UIImage#>, dateString: <#T##String#>, temperatureString: <#T##String#>, weatherConditionString: <#T##String#>)]
//}
