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
    }
    
    func updateList(list: [String : [Result]]) {
        self.moviesList = list
        self.moviesCollectionView.reloadData()
    }
}

extension ViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: 128, height: 128)
    }
    
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
