//
//  EarthquakeTableViewModel.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeTableViewModel: EarthquakeTableViewModelType {
   
    //MARK:- Properties
    private var earthquakeMetadata : Earthquakes?
    private var earthquakes = [Earthquake]()
    private let apiService : ApiService!
    
    var numberOfRows: Int {
        return earthquakes.count
    }
    weak var delegate: EarthquakeTableViewModelDelegate?
    
    
    //MARK:- Init
    init(service : ApiService) {
        self.apiService = service
    }
    
    //MARK:- Methods
    func cellViewModel(forIndexPath indexPath: IndexPath) -> EarthquakeCellViewModelType? {
        let earthquake = earthquakes[indexPath.row]
        return EarthquakeCellViewModel(earthquake: earthquake)
    }
    
    func viewModelForSelectedRow(forIndexPath indexPath: IndexPath) -> EarthquakeDetailViewModelType? {
        let earthquake = earthquakes[indexPath.row]
        return EarthquakeDetailViewModel(earthquake: earthquake)
    }
    
    /// Following method is fore fetch Earthquakeds
    /// - Parameter page: `Page` should be minimum `1`
    func fetchEarthquakes(page : Int){
        delegate?.willLoadData()
        apiService.getListEarthquake(page: page) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let earthQuakes):
                self.earthquakeMetadata = earthQuakes
                if let earthquakes = earthQuakes.earthquakes {
                    self.earthquakes.append(contentsOf: earthquakes)
                }
                self.delegate?.didLoadData()
            case .failure(let error):
                self.delegate?.didLoadDataFailed(error: error)
            }
        }
    }
}
