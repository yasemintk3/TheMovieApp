//
//  MoviesPage.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import UIKit

class MoviesPage: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = MoviesPageViewModel()
    var listTopRated: [String: [ResultMovies]] = ["0": []]
    var listNowPlaying: [String: [ResultMovies]] = ["0": []]
    var listPopular: [String: [ResultMovies]] = ["0": []]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.output = self
        
        collectionViewDesign()
    }

    func collectionViewDesign() {
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        design.minimumInteritemSpacing = 4
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth / 1.78)
        
        collectionView.collectionViewLayout = design
    }
}

extension MoviesPage: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! MovieViewCell
        
        switch indexPath.row {
        case 0:
            cell.labelType.text = "Top Rated Movies"
            cell.updateList(list: listTopRated)
        case 1:
            cell.labelType.text = "Now Playing Movies"
            cell.updateList(list: listNowPlaying)
        case 2:
            cell.labelType.text = "Popular Movies"
            cell.updateList(list: listPopular)
        default:
            break
        }
        return cell
    }
}

extension MoviesPage: MoviesPageViewModelOutput {

    func updateViewTopRated(list: [String: [ResultMovies]]) {
        DispatchQueue.main.async {
            self.listTopRated = list
            self.collectionView.reloadData()
        }
    }
    
    func updateViewNowPlaying(list: [String : [ResultMovies]]) {
        DispatchQueue.main.async {
            self.listNowPlaying = list
            self.collectionView.reloadData()
        }
    }
    
    func updateViewPopular(list: [String : [ResultMovies]]) {
        DispatchQueue.main.async {
            self.listPopular = list
            self.collectionView.reloadData()
        }
    }
}
