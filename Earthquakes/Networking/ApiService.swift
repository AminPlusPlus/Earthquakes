//
//  ApiService.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import Foundation

class ApiService {
    private let baseURL = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson"

    //MARK:- Methods
    
    /// Fetching the list of earthquakes
    /// - Parameters:
    ///   - page: `Int` Paging by the 10
    ///   - completed: `Result` of `Earthquake` and `EQError`
    func getListEarthquake(page : Int, completed : @escaping (Result<Earthquakes,EQError>) -> Void) {
        
        let currentDate = Date().convertToYearMonthDateFormat()
        let last30Days = Date().getNextPreviusDays(day: -30).convertToYearMonthDateFormat()
        let endPoint  = baseURL + "&starttime=\(last30Days)&limit=20&orderby=time&offset=\(page)&eventtype=earthquake&endtime=\(currentDate)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            //Decode data to the model
            do {
                let earthquakes = try JSONDecoder().decode(Earthquakes.self, from: data)
                completed(.success(earthquakes))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
}
