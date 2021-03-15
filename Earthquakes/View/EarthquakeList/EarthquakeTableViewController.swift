//
//  EarthquakeTableViewController.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import UIKit

final class EarthquakeTableViewController : UITableViewController {
    
    //MARK:- Properties
    fileprivate var viewModel   : EarthquakeTableViewModelType!
    fileprivate var currentPage = 1
    fileprivate var isFetching  = false
    
    //MARK:- UI Elements
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
       
        //Setup View Model
        viewModel = EarthquakeTableViewModel(service: ApiService())
        viewModel?.delegate = self
        viewModel?.fetchEarthquakes(page: currentPage)
    }
    
    //MARK:- Methods
    fileprivate func setupView(){
        navigationItem.title = "Earthquakes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshContent))
        // Set AccessibilityIdentifier
        navigationItem.rightBarButtonItem?.accessibilityIdentifier = AccessibilityIdentifiers.AXEarthquakeMainView.ReloadButton
    }
    
    private func setupTableView() {
        tableView.register(EarthquakeTableViewCell.self, forCellReuseIdentifier: EarthquakeTableViewCell.Identifier)
        tableView.rowHeight = 70
        // Set AccessibilityIdentifier
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.AXEarthquakeMainView.EarthquakeTableView
    }
    
    @objc func refreshContent(){

        if viewModel.numberOfRows > 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        } else {
            viewModel?.fetchEarthquakes(page: currentPage)
        }
        
    }
        
    //MARK:- Data Source & Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         let lastSectionIndex = tableView.numberOfSections - 1
         let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex && viewModel.numberOfRows > 0 {
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.frame = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 70)
            spinner.startAnimating()
            tableView.tableFooterView = spinner
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeTableViewCell.Identifier, for: indexPath) as! EarthquakeTableViewCell
        
        guard let viewModelCell = viewModel.cellViewModel(forIndexPath: indexPath) else {return UITableViewCell()}
        
        //last cell fetchMore
        if indexPath.row == viewModel.numberOfRows - 1 && !isFetching {
            currentPage += 1
            self.viewModel?.fetchEarthquakes(page: currentPage)
        }
        cell.viewModel = viewModelCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel.viewModelForSelectedRow(forIndexPath: indexPath) else {return}
        let detailViewController = EarthquakeDetailViewController()
        detailViewController.viewModel = viewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


//MARK:- Delegate Methods of ViewModel
extension EarthquakeTableViewController : EarthquakeTableViewModelDelegate {
    func willLoadData() {
        self.isFetching = true
        
        //Initial spinner
        if viewModel.numberOfRows < 1 {
            self.showLoadingView()
        }
    }
    
    func didLoadData() {
        DispatchQueue.main.async {
            self.dismissLoadingView()
            self.tableView.reloadData()
            self.isFetching = false
        }
    }
    
    func didLoadDataFailed(error: EQError) {
        self.dismissLoadingView()
        self.presentAlertView(title: "Opps", message: error.localizedDescription, buttonTitle: "Hmm Okay!")
        self.isFetching = false
    }
}
