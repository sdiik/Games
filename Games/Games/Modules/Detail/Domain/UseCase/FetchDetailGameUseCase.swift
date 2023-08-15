//
//  FetchDetailGameUseCase.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

typealias FetchDetailFameUseCaseCompletionHandler = (_ result: Result<DetailItemModel, FetchDetailGameError>) -> Void

protocol FetchDetailGameUseCase {
    func execute(with idGame: Int, completionHandle: @escaping FetchDetailFameUseCaseCompletionHandler)
}
