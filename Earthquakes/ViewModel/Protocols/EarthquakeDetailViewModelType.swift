//
//  EarthquakeDetailViewModelType.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/12/21.
//

import UIKit

protocol EarthquakeDetailViewModelType {
    var place     : NSAttributedString {get}
    var magnitute : NSAttributedString {get}
    var status    : NSAttributedString {get}
    var depth     : NSAttributedString {get}
    var detailURL : URL {get}
}
