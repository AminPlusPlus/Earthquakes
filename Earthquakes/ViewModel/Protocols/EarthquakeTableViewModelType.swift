//
//  EarthQuakeTableViewModelType.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/12/21.
//

import Foundation

protocol EarthquakeTableViewModelType {
    var  numberOfRows : Int {get}
    var  delegate : EarthquakeTableViewModelDelegate? {get set}
    func cellViewModel(forIndexPath indexPath: IndexPath) -> EarthquakeCellViewModelType?
    func viewModelForSelectedRow(forIndexPath indexPath: IndexPath) -> EarthquakeDetailViewModelType?
    func fetchEarthquakes(page : Int)
}
