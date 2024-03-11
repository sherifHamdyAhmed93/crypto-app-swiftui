//
//  NetworkManager.swift
//  Crypto-app
//
//  Created by Sherif Hamdy on 11/03/2024.
//

import Foundation
import Combine
class NetworkManager{
    
    enum NetworkError:LocalizedError{
        case badUrlResponse(url:URL)
        case unknown
        
        var errorDescription: String?{
            switch self{
            case .badUrlResponse(let url):
                return "❌ Bad response from url : \(url)"
            case .unknown:
                return "unknown error occured"
            }
        }
        
    }
    
    static func download(url:URL)->AnyPublisher<Data, Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private static func handleResponse(output: URLSession.DataTaskPublisher.Output,url:URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300  else{
            throw NetworkError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion : Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
