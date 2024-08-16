//
//  TargetConfigurator.swift
//  Idyllic Church
//
//  Created by Peter Samir on 18/11/2022.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    /// A request with no additional data.
    case requestPlain
    /// A requests body set with encoded parameters.
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetConfigurator {
    /// The path to be appended to `baseURL` to form the full `URL`.
    var baseURL : String {get}
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get } /// The type of HTTP task to be performed.
    var headers: [String: String]? { get }
}
