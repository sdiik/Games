//
//  DetailGameRepository.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

typealias FetchDetailGameResult = (_ result: Result<DetailItemModel, FetchDetailGameError>) -> Void

protocol DetailGameRepository {
    func fetchDetailGame(with id: Int, result: @escaping FetchDetailGameResult)
}
