//
//  FetchDetailGameUseCaseImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class FetchDetailGameUseCaseImpl: FetchDetailGameUseCase {
    let detailGameRepository: DetailGameRepository
    
    init(detailGameRepository: DetailGameRepository = DetailGameRepositoryImpl()) {
        self.detailGameRepository = detailGameRepository
    }
    
    func execute(with idGame: Int, completionHandle: @escaping FetchDetailFameUseCaseCompletionHandler) {
        detailGameRepository.fetchDetailGame(with: idGame) { fetchDetailGameResult in
            switch fetchDetailGameResult {
            case .success(let detail):
                completionHandle(.success(detail))
            case .failure(let error):
                completionHandle(.failure(error))
            }
        }
    }
}
