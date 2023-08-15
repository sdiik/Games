//
//  FetchGameListUseCaseImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class FetchGameListUseCaseImpl: FetchGameListUseCase {
    let gamesListRepository: GameListRepository
    
    init(gamesListRepository: GameListRepository = GameListRepositoryImpl()) {
        self.gamesListRepository = gamesListRepository
    }
    
    func execute(pageNumber: Int?, pageSize: Int?, keyword: String?, completionHandler: @escaping FetchGameListUseCaseCompletionHandler) {
        gamesListRepository.fetchGameList(pageNumber: pageNumber, pageSize: pageSize, keyword: keyword) { fetchGameListResult in
            switch fetchGameListResult {
            case .success(let games):
                guard let alreadyGameList = games.gameList else {
                    completionHandler(.failure(.parsing))
                    return
                }
                completionHandler(.success(alreadyGameList))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
