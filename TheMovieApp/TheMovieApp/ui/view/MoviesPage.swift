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
    var listTopRated: [String: [Result]] = ["0": []]
    var listNowPlaying: [String: [Result]] = ["0": []]
    var listPopular: [String: [Result]] = ["0": []]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.output = self
        
        collectionViewDesign()
    }

    func collectionViewDesign() {
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        tasarim.minimumInteritemSpacing = 10
        //tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = ekranGenislik
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik / 1.85)
        
        collectionView.collectionViewLayout = tasarim
    }
}

extension MoviesPage: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! ViewCell
        
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

    func updateViewTopRated(list: [String: [Result]]) {
        DispatchQueue.main.async {
            self.listTopRated = list
            self.collectionView.reloadData()
        }
    }
    
    func updateViewNowPlaying(list: [String : [Result]]) {
        DispatchQueue.main.async {
            self.listNowPlaying = list
            self.collectionView.reloadData()
        }
    }
    
    func updateViewPopular(list: [String : [Result]]) {
        DispatchQueue.main.async {
            self.listPopular = list
            self.collectionView.reloadData()
        }
    }
}
