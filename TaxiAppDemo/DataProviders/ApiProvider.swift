//
//  ApiProvider.swift
//  TaxiAppDemo
//
//  Created by Павел Виноградов on 06.01.2023.
//

import Foundation

class ApiProvider<Target: ApiTarget> {
    
    private let baseUrl = Constants.baseUrl
    
    @discardableResult
    func getData<T: Codable>(_ target: Target,
                             model: T.Type,
                             responseQueue: DispatchQueue? = .main,
                             completion: @escaping (Result<T, Error>) -> Void) -> URLSessionDataTask {
        
        let url = baseUrl.appendingPathComponent(target.endPoint)
        
        func fail(_ error: Error) {
            if let responseQueue = responseQueue {
                responseQueue.async {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error))
            }
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { fail(error!); return }
            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(T.self, from: data)
                if let queue = responseQueue {
                    queue.async { completion(.success(result)) }
                } else {
                    completion(.success(result))
                }
            } catch {
                fail(error)
            }
        }
        task.resume()
        return task
    }
}
