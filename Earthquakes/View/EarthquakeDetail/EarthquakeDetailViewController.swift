//
//  EarthquakeDetailViewController.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeDetailViewController: UIViewController {
    
    //MARK:- Properties
    var viewModel : EarthquakeDetailViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            placeLabel.attributedText = viewModel.place
            magLabel.attributedText = viewModel.magnitute
            depthLabel.attributedText = viewModel.depth
            statusLabel.attributedText = viewModel.status
        }
    }
    
    //MARK:- UI Elements
    fileprivate let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    fileprivate let placeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    fileprivate let magLabel : UILabel = {
        let label = UILabel()
        
        return label
    }()
    fileprivate let depthLabel : UILabel = {
        let label = UILabel()
        
        return label
    }()
    fileprivate let statusLabel : UILabel = {
        let label = UILabel()
        
        return label
    }()
    fileprivate lazy var moreDetailBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Browse More Detail", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(openDetailInBrowser), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK:- Methods
    
    /// Setup Views and Constrains
    fileprivate func setupView() {
        navigationItem.title = "Detail of Earthquake"
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.addArrangedSubview(placeLabel)
        stackView.addArrangedSubview(magLabel)
        stackView.addArrangedSubview(depthLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(moreDetailBtn)
        
        //Constrains
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
    }
    
    @objc func openDetailInBrowser() {
        guard let viewModel = viewModel else {
            return
        }
        UIApplication.shared.open(viewModel.detailURL)
    }
}
