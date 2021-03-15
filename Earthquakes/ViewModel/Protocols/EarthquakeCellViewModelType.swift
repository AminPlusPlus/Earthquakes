//
//  EarthquakeCellViewModelType.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/12/21.
//

import UIKit

protocol EarthquakeCellViewModelType : class {
    var title     : NSAttributedString {get}
    var magnitute : NSAttributedString {get}
}
