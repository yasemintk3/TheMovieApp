//
//  TVShowsViewCell.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import UIKit

protocol TVShowsViewCellProtocol {
    func didSelectItem(id: [String: Int])
}

class TVShowsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var tvShowsCollectionView: UICollectionView!
    
    var tvShowList: [String: [ResultTVShows]] = ["0": []]
    var delegate: TVShowsViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tvShowsCollectionView.delegate = self
        tvShowsCollectionView.dataSource = self
        
        collectionViewDesign()
    }
    
    func updateList(list: [String : [ResultTVShows]]) {
        self.tvShowList = list
        self.tvShowsCollectionView.reloadData()
    }
    
    func collectionViewDesign() {
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        design.minimumLineSpacing = 10
        design.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth
        
        design.itemSize = CGSize(width: itemWidth / 2.5, height: itemWidth / 1.3)
        
        tvShowsCollectionView.collectionViewLayout = design
    }
}

extension TVShowsViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        for (key, value) in tvShowList {
            switch key {
            case "1":
                return value.count
            case "2":
                return value.count
            default:
                break
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvShowsCell", for: indexPath) as! TVShowsCell
        
        for (key, value) in tvShowList {
            switch key {
            case "1":
                let tvShow = value[indexPath.row]
                
                if let url = URL(string:"https://image.tmdb.org/t/p/w500" + tvShow.posterPath!) {
                     DispatchQueue.main.async {
                         cell.imageViewTVShow.kf.setImage(with: url)
                     }
                }
                cell.labelTVShowName.text = tvShow.name
                
            case "2":
                let tvShow = value[indexPath.row]
                
                if let url = URL(string:"https://image.tmdb.org/t/p/w500" + tvShow.posterPath!) {
                     DispatchQueue.main.async {
                         cell.imageViewTVShow.kf.setImage(with: url)
                     }
                }
                cell.labelTVShowName.text = tvShow.name
                
            default:
                break
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for (_, value) in tvShowList {
            if let id = value[indexPath.row].id {
                delegate?.didSelectItem(id: ["tvShow": id])
            }
        }
    }
}
