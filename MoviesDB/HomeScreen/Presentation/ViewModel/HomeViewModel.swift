//
//  HomeViewModel.swift
//  MoviesDB
//
//  Created by Peter Samir on 18/08/2024.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    let moviesList: BehaviorRelay<[Movie]> = BehaviorRelay(value: [])
    let error = PublishSubject<String>()
    let moviesRemoteDataSource: MoviesRemoteDatasource
    let disposeBag: DisposeBag
    
    init(moviesRemoteDataSource: MoviesRemoteDatasource) {
        self.moviesRemoteDataSource = moviesRemoteDataSource
        self.disposeBag = DisposeBag()
        
        self.getMovies()
    }
    
    
    func getMovies() {
        self.moviesRemoteDataSource.getMovies(page: "1", language: Locale.preferredLanguages[1]) { response in
            switch response {
            case .success(let movie):
                guard let movie = movie else { return }
                DispatchQueue.main.async {
                    self.moviesList.accept(movie)
                }
            case .failure(let error):
                print(error)
//                self.error.acc
            }
        }
    }
}
