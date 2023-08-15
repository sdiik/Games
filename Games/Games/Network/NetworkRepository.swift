//
//  NetworkRepository.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

typealias FetchRequestResult = (_ result: Result<(HTTPURLResponse, Data), Error>) -> Void

protocol NetworkRepository {
    func fetchRequest(_ url: URL, result: @escaping FetchRequestResult)
}
