//
//  FavoriteViewModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

protocol FavoriteDelegate {
    func isLoading(status: Bool)
    func fetchFavoriteSuccess()
    func fetchFavoriteFailed(with message: String)
}

class FavoriteViewModel {
    
    private let fetchDetailGameUseCase: FetchDetailGameUseCase
    var delegate: FavoriteDelegate?
    var detailGame = [GameItemDataModel]()
    
    init(fetchDetailGameUseCase: FetchDetailGameUseCase = FetchDetailGameUseCaseImpl()) {
        self.fetchDetailGameUseCase = fetchDetailGameUseCase
    }
    
    func callFetchFavoriteGame() {
        detailGame.removeAll()
        if FavoritesSaved.getFavoriteIds().isEmpty {
            delegate?.fetchFavoriteSuccess()
        } else {
            delegate?.isLoading(status: true)
            getDetailGameById()
        }
        
    }
    
    private func getDetailGameById() {
        for (position, item) in FavoritesSaved.getFavoriteIds().enumerated() {
            onMainThreadAsync { [weak self] in
                self?.fetchDetailGameUseCase.execute(with: item) { result in
                    onMainThreadAsync { [weak self] in
                        switch result {
                        case .success(let data):
                            let convertData = GameItemDataModel(id: data.id,
                                                                name: data.name,
                                                                backgroundImage: data.imageUrl,
                                                                released: data.released,
                                                                rating: data.rating)
                            self?.detailGame.append(convertData)
                            self?.delegate?.fetchFavoriteSuccess()
                            if position == FavoritesSaved.getFavoriteIds().count - 1 {
                                self?.delegate?.isLoading(status: false)
                            }
                        case .failure(let error):
                            self?.delegate?.isLoading(status: false)
                            self?.delegate?.fetchFavoriteFailed(with: error.localizedDescription)
                            break
                        }
                    }
                }
            }
        }
    }
}
