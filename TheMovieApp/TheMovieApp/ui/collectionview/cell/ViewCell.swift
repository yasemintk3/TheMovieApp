//
//  ViewCell.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 23.04.2024.
//

import UIKit
import Kingfisher

class ViewCell: UICollectionViewCell {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var labelType: UILabel!
    
    var moviesList: [String: [Result]] = ["0": []]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        collectionViewDesign()
    }
    
    func updateList(list: [String : [Result]]) {
        self.moviesList = list
        self.moviesCollectionView.reloadData()
    }
    
    func collectionViewDesign() {
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        tasarim.scrollDirection = .horizontal
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = ekranGenislik
        
        tasarim.itemSize = CGSize(width: itemGenislik / 4, height: itemGenislik / 2.1)
        
        moviesCollectionView.collectionViewLayout = tasarim
    }
}

extension ViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        for (key, value) in moviesList {
            switch key {
            case "1":
                return value.count
            case "2":
                return value.count
            case "3":
                return value.count
            default:
                break
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! MoviesCell
        
        for (key, value) in moviesList {
            switch key {
            case "1":
                let movie = value[indexPath.row]
                
                if let url = URL(string:"https://image.tmdb.org/t/p/w500" + movie.posterPath!) {
                     DispatchQueue.main.async {
                         cell.imageViewMovie.kf.setImage(with: url)
                     }
                }
                cell.labelMovieName.text = movie.title
                
            case "2":
                let movie = value[indexPath.row]
                
                if let url = URL(string:"https://image.tmdb.org/t/p/w500" + movie.posterPath!) {
                     DispatchQueue.main.async {
                         cell.imageViewMovie.kf.setImage(with: url)
                     }
                }
                cell.labelMovieName.text = movie.title
                
            case "3":
                let movie = value[indexPath.row]
                
                if let url = URL(string:"https://image.tmdb.org/t/p/w500" + movie.posterPath!) {
                     DispatchQueue.main.async {
                         cell.imageViewMovie.kf.setImage(with: url)
                     }
                }
                cell.labelMovieName.text = movie.title
                
            default:
                break
            }
        }
        return cell
    }
}
