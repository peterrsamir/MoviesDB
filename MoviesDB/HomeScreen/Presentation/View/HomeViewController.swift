//
//  HomeViewController.swift
//  MoviesDB
//
//  Created by Peter Samir on 16/08/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let arr = ["arr", "arr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCell()
    }
}


// MARK: - Table view Delegate
extension HomeViewController: UITableViewDelegate {
    
    private func initializeCell() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
    }
}
// MARK: - Table view Data Source
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.prepareCell(movie: arr[indexPath])
        return cell
    }
}
