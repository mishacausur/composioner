//
//  Streams.swift
//  composioner
//
//  Created by Misha Causur on 09.05.2022.
//

import Foundation

struct NetworkService {
    enum State {
        case progress(Float)
        case completed(Data)
    }
    private func fetchData(url: URL, progressHandler: (Float) -> Void, completionHandler: (Result<Data, Error>) -> Void) throws {
        
    }
    
    public func fetch(url: URL) -> AsyncThrowingStream<State, Error> {
        return AsyncThrowingStream { continuation in
            do {
                try fetchData(url: url, progressHandler: { progress in
                    continuation.yield(.progress(progress))
                }, completionHandler: { result in
                    switch result {
                    case .success(let data):
                    case .failure(let error):
                    }
                })
            } catch {
                
            }
        }
    }
}
