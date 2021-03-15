//
//  EarthquakeTableViewCell.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    public static let Identifier = "cell"
    weak var viewModel : EarthquakeCellViewModelType? {
        willSet(viewModel){
            guard let viewModel = viewModel else {return}
            textLabel?.attributedText = viewModel.title
            detailTextLabel?.attributedText = viewModel.magnitute
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        accessoryType  = .disclosureIndicator
        selectionStyle = .none
        
        // Set AccessibilityIdentifier
        textLabel?.accessibilityIdentifier = AccessibilityIdentifiers.AXEarthquakeTableCell.title
        detailTextLabel?.accessibilityIdentifier = AccessibilityIdentifiers.AXEarthquakeTableCell.subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
