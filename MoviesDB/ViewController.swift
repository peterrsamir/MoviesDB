//
//  ViewController.swift
//  MoviesDB
//
//  Created by Peter Samir on 15/08/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RemoteDataSource().getMoviesList()
    }


}

class RemoteDataSource: BaseApi<MoviesConfigurations> {
    func getMoviesList() {
        self.fetchData(target: .getMovies(page: "0", language: Locale.preferredLanguages[0]), responseClass: MoviesModel.self) { result in
            switch result {
            case .success(let movies):
                print(movies?.movies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
