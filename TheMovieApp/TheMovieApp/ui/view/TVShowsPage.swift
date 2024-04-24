//
//  TVShowsPage.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import UIKit

class TVShowsPage: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = TVShowsPageViewModel()
    var listTopRated: [String: [ResultTVShows]] = ["0": []]
    var listPopular: [String: [ResultTVShows]] = ["0": []]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.output = self

        collectionViewDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadTVShows()
    }

    func collectionViewDesign() {
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        design.minimumInteritemSpacing = 4
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth / 1.18)
        
        collectionView.collectionViewLayout = design
    }
}

extension TVShowsPage: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvShowsViewCell", for: indexPath) as! TVShowsViewCell
        
        switch indexPath.row {
        case 0:
            cell.labelType.text = "Top Rated TV Shows"
            cell.updateList(list: listTopRated)
        case 1:
            cell.labelType.text = "Now Playing TV Shows"
            cell.updateList(list: listPopular)
        default:
            break
        }
        cell.delegate = self
        return cell
    }
}

extension TVShowsPage: TVShowsPageViewModelOutput {
    
    func updateViewTopRatedTV(list: [String : [ResultTVShows]]) {
        self.listTopRated = list
        collectionView.reloadData()
    }
    
    func updateViewPopularTV(list: [String : [ResultTVShows]]) {
        self.listPopular = list
        collectionView.reloadData()
    }
}

extension TVShowsPage: TVShowsViewCellProtocol {
    
    func didSelectItem(id: [String : Int]) {
        let detailPage = self.storyboard?.instantiateViewController(withIdentifier: "DetailPage") as! DetailPage
        detailPage.id = id
        detailPage.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(detailPage, animated: true)
    }
}
