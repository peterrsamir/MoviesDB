//
//  NetworkConstants.swift
//  MoviesDB
//
//  Created by Peter Samir on 16/08/2024.
//

import Foundation

enum NetworkConstants{
    enum APIConstatnts {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let TMDBKey = "e9912676b4f10a5ede8c17993d87034b"
        static let moviesUrlPath = "discover/movie"
        static let moviesDetailsUrlPath = "movie/%d"
        static let includeAdults = "include_adult"
        static let includeVideo = "include_video"
        static let language = "language"
        static let page = "page"
        static let sortBy = "sort_by"
        static let popularityDesc = "popularity.desc"
    }
}
