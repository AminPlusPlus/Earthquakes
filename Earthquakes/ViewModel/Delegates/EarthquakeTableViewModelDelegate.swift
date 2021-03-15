//
//  EarthquakeTableViewModelDelegate.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

protocol EarthquakeTableViewModelDelegate : class {
    func willLoadData()
    func didLoadData()
    func didLoadDataFailed(error : EQError)
}
