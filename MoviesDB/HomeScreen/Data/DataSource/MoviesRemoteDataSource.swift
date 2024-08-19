//
//  MoviesRemoteDataSource.swift
//  MoviesDB
//
//  Created by Peter Samir on 18/08/2024.
//

import Foundation

class MoviesRemoteDatasource : BaseApi<MoviesConfigurations> {
    
    func getMovies(page: String, language: String, completion: @escaping (Result<[Movie]?, NSError>) -> Void) {
        self.fetchData(target: .getMovies(page: page, language: language), responseClass: MoviesModel.self) { (result) in
            switch result {
            case .success(let movieModel):
                completion(.success(movieModel?.movies))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
