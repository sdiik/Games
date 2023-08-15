//
//  DetailGameViewModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

protocol DetailGameViewDelegate {
    func isLoading(status: Bool)
    func fetchDetailGameSuccess()
    func fetchDetailGameFailed(with message: String)
}

class DetailGameViewModel {
    
    private let fetchDetailGameUseCase: FetchDetailGameUseCase
    var delegate: DetailGameViewDelegate?
    var detailGame: DetailItemModel?
    
    init(fetchDetailGameUseCase: FetchDetailGameUseCase = FetchDetailGameUseCaseImpl()) {
        self.fetchDetailGameUseCase = fetchDetailGameUseCase
    }
    
    func callFetchDetailGame(with id: Int) {
        delegate?.isLoading(status: true)
        fetchDetailGameUseCase.execute(with: id) { [weak self] result in
            onMainThreadAsync { [weak self] in
                switch result {
                case .success(let data):
                    self?.detailGame = data
                    self?.delegate?.fetchDetailGameSuccess()
                case .failure(let error):
                    self?.delegate?.fetchDetailGameFailed(with: error.localizedDescription)
                }
                self?.delegate?.isLoading(status: false)
            }
        }
    }
}
