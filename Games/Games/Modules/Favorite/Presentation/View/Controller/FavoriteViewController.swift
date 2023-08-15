//
//  FavoriteViewController.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class FavoriteViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var favoritesTableView: UITableView! {
        didSet {
            favoritesTableView.delegate = self
            favoritesTableView.dataSource = self
        }
    }
    
    var favoriteViewModel = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteViewModel.delegate = self
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showTabBar()
        callFavorite()
    }
    
    private func setupView() {
        favoritesTableView.register(
            UINib(nibName: TableCells.Cell.game, bundle: nil),
            forCellReuseIdentifier: TableCells.Cell.game)
        favoritesTableView.register(
            UINib(nibName: TableCells.Cell.empty, bundle: nil),
            forCellReuseIdentifier: TableCells.Cell.empty)
    }
    
    private func callFavorite() {
         self.favoriteViewModel.callFetchFavoriteGame()
    }
}
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favoriteViewModel.detailGame.isEmpty {
            return 1
        } else {
            return favoriteViewModel.detailGame.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if favoriteViewModel.detailGame.isEmpty {
            return self.tableView(tableView, cellForEmptyGameRowAt: indexPath)
        } else {
            return self.tableView(tableView, cellForGameRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForGameRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCells.Cell.game,
            for: indexPath) as? GameTableCell
        else { return UITableViewCell() }
        cell.setupView(with: favoriteViewModel.detailGame[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForEmptyGameRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableCells.Cell.empty,
            for: indexPath) as? EmptyTableCell
        else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameSelected = favoriteViewModel.detailGame[indexPath.row]
        let detailGame = DetailViewController()
        detailGame.setDetailId(with: gameSelected.id ?? 0)
        self.navigationController?.pushViewController(detailGame, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if favoriteViewModel.detailGame.isEmpty {
            return tableView.frame.height
        }
        return UITableView.automaticDimension
    }
}
extension FavoriteViewController: FavoriteDelegate {
    func isLoading(status: Bool) {
        if status {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
    
    func fetchFavoriteSuccess() {
        onMainThreadAsync { [weak self] in
            self?.favoritesTableView.reloadData()
        }
    }
    
    func fetchFavoriteFailed(with message: String) {
        Alert.showMessage(with: message, controller: self)
    }
}

