//
//  NetworkLayer.swift
//  Idyllic Church
//
//  Created by Peter Samir on 13/11/2022.
//

import Foundation
import Alamofire

class BaseApi<T:TargetConfigurator> {
    
    //MARK: - call api
    func fetchData<M:Codable>(target: T, responseClass: M.Type, completion:@escaping(Result<M?, NSError>) -> Void ) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).response {
            print("----------------New CAll------------------------")
            print("--------------- \n base url: \(target.baseURL)\n mthod: \(method)\n header:  \(headers)\n params: \(params)")
            
            guard let statusCode = $0.response?.statusCode else {
                let error = NSError(domain: target.baseURL+target.path, code: 0, userInfo: [NSLocalizedDescriptionKey: "ErrorMessage.genericError"])
//                completion(.failure(error))
                return
            }
            switch $0.result {
                
            case .success(let data):
                print("--------------------------------------------------------\n",
                      "URL: \(target.baseURL+target.path)\n",
                      "response.result: \n",data?.toString ?? "",
                      "\n--------------------------------------------------------")
                
                // MARK: - check status code
                if statusCode == 200 {
                    if let data = data {
                        let (model, error) = data.Decode(M.self)
                        if let model = model {
                            completion(.success(model))
                        } else if let error = error {
                            completion(.failure(error as NSError))
                        }
                    }
                }
                else {
                    guard let data = data else {return}
                    if let error = data.Decode(M.self).1 {
                        completion(.failure(error as NSError))
                    }
                }
            case .failure(let err):
                print("--------------------------------------------------------\n",
                      "URL: \(target.baseURL)\(target.path)\n",
                      "Header: \(headers)",
                      "prams: \(params)",
                      "response.error :( \n",err.localizedDescription,
                      "\n--------------------------------------------------------")
                completion(.failure(err as NSError))
                break
            }
        }
    }
    
    // MARK: - setup Parameters
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
