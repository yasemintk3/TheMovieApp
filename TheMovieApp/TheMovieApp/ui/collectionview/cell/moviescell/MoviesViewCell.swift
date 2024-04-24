//
//  MovieViewCell.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 23.04.2024.
//

import UIKit
import Kingfisher

protocol MoviesViewCellProtocol {
    func didSelectItem(id: [String: Int])
}

class MoviesViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var moviesList: [String: [ResultMovies]] = ["0": []]
    var delegate: MoviesViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        collectionViewDesign()
    }
    
    func updateList(list: [String : [ResultMovies]]) {
        self.moviesList = list
        self.moviesCollectionView.reloadData()
    }
    
    func collectionViewDesign() {
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        design.minimumLineSpacing = 10
        design.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth
        
        design.itemSize = CGSize(width: itemWidth / 4, height: itemWidth / 2.1)
        
        moviesCollectionView.collectionViewLayout = design
    }
}

extension MoviesViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for (_, value) in moviesList {
            if let id = value[indexPath.row].id {
                delegate?.didSelectItem(id: ["movie": id])
            }
        }
    }
}
