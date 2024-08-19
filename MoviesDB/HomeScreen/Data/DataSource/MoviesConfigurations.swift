//
//  MoviesConfigurations.swift
//  MoviesDB
//
//  Created by Peter Samir on 16/08/2024.
//

import Foundation
import Alamofire

enum MoviesConfigurations {
    case getMovies(page: String, language: String)
    case getMovieDetails(id: Int, language: String)
}

extension MoviesConfigurations: TargetConfigurator {
    var baseURL: String {
        return NetworkConstants.APIConstatnts.baseURL
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return NetworkConstants.APIConstatnts.moviesUrlPath
        case .getMovieDetails(let id, _):
            return String(format: NetworkConstants.APIConstatnts.moviesDetailsUrlPath, id)
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getMovies(let page, let language):
            var params: [String: Any] = [
                NetworkConstants.APIConstatnts.includeAdults: false,
                NetworkConstants.APIConstatnts.includeVideo: false,
                NetworkConstants.APIConstatnts.language: "language",
                NetworkConstants.APIConstatnts.page:"1",
                NetworkConstants.APIConstatnts.sortBy: NetworkConstants.APIConstatnts.popularityDesc,
                "api_key": NetworkConstants.APIConstatnts.TMDBKey
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .getMovieDetails(_, let language):
            var params: [String: Any] = [
                NetworkConstants.APIConstatnts.language: language,
                "api_key": NetworkConstants.APIConstatnts.TMDBKey
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
}
