//
//  HomeViewController.swift
//  MoviesDB
//
//  Created by Peter Samir on 16/08/2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    private let viewmodel: HomeViewModel
    private let disposeBag: DisposeBag
    
    init(viewmodel: HomeViewModel) {
        self.viewmodel = viewmodel
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
            tableView.rx.setDelegate(self).disposed(by: disposeBag)
        prepateTableView()
    }
    
    func prepateTableView() {
        self.viewmodel.moviesList.asObservable()
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: self.tableView.rx
                .items(cellIdentifier: "MovieTableViewCell", cellType: MovieTableViewCell.self))
        { index, element, cell in
            cell.prepareCell(movie: element)
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Movie.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.title)")
        }).disposed(by: disposeBag)
    }
}

extension HomeViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height*0.4
    }
}
