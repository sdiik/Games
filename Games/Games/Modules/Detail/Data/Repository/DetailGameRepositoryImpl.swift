//
//  DetailGameRepositoryImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class DetailGameRepositoryImpl: DetailGameRepository {
    
    let networkRepository: NetworkRepository
    let detailGameApiFactory: DetailGameApiFactory
    
    init(networkRepository: NetworkRepository = NetworkRepositoryImpl(),
         detailGameApiFactory: DetailGameApiFactory = DetailGameApiFactoryImpl()) {
        self.networkRepository = networkRepository
        self.detailGameApiFactory = detailGameApiFactory
    }
    
    func fetchDetailGame(with id: Int, result: @escaping FetchDetailGameResult) {
        guard let url = detailGameApiFactory.createGameDetailUrl(with: id).url else {
            result(.failure(.loading))
            return
        }
        networkRepository.fetchRequest(url) { networkResult in
            switch networkResult {
            case .success(let response):
                let (urlResponse, data) = response
                guard urlResponse.statusCode.isOk else {
                    result(.failure(.loading))
                    return
                }
                self.parse(data: data, result: result)
            case .failure:
                result(.failure(.loading))
            }
        }
    }
    private func parse(data: Data, result: @escaping FetchDetailGameResult) {
        do {
            let resultDecode = try JSONDecoder().decode(DetailItemModel.self, from: data)
            result(.success(resultDecode))
        } catch {
            result(.failure(.parsing))
        }
    }
    
}
