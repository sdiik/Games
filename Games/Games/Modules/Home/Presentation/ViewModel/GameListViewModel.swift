//
//  GameListViewModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

protocol GameListViewDelegate {
    func isLoading(status: Bool)
    func fetchGameListSuccess()
    func fetchGameListFailed(with message: String)
}

class GameListViewModel {
     
    private let fetchGameListUseCase: FetchGameListUseCase
    var delegate: GameListViewDelegate?
    
    var keyword = ""
    var pageNumber = 1
    var pageSize = 10
    var games = [GameItemDataModel]() {
        didSet {
            delegate?.fetchGameListSuccess()
        }
    }
    
    init(fetchGameListUseCase: FetchGameListUseCase = FetchGameListUseCaseImpl()) {
        self.fetchGameListUseCase = fetchGameListUseCase
    }

    func callFetchGames(keyword: String = "", isUpdate: Bool = false) {
        if !isUpdate { pageNumber = 1 }
        delegate?.isLoading(status: true)
        fetchGameListUseCase.execute(pageNumber: pageNumber, pageSize: pageSize, keyword: keyword) { [weak self] result in
            onMainThreadAsync { [weak self] in
                switch result {
                case .success(let data):
                    if self?.pageNumber == 1 {
                        self?.games = data
                    } else {
                        self?.games.append(contentsOf: data)
                    }
                    self?.pageNumber += 1
                case .failure(let error):
                    self?.delegate?.fetchGameListFailed(with: error.localizedDescription)
                }
                self?.delegate?.isLoading(status: false)
            }
        }
    }
}
