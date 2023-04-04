//
//  WeatherView.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation
import UIKit

class WeatherView : UIViewController {
    
    private var tableView: UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "valueCell")
        return tv
    }()
    
    private let presenter: WeatherPresenter
    
    init(presenter: WeatherPresenter) {
        
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
        presenter.onViewAppear()
    }
    
    func configTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)])
    }
}

extension WeatherView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "valueCell", for: indexPath)
        
        let value = presenter.dataset[indexPath.row]
        
        cell.textLabel?.text = "El valor de value es: \(value)"
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.green : UIColor.white
        
        return cell
    }
}

extension WeatherView : WeatherUI {
    func updatelistValues() {
        DispatchQueue.main.async {
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }
    
    func showError(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertActionx in
                self.presenter.onViewAppear()
            }))
            
            self.present(alert, animated: true)
        }
    }
}
