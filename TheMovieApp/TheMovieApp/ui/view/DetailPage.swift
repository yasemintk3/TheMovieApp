//
//  DetailPage.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import UIKit

class DetailPage: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelOriginalName: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    var viewModel = DetailPageViewModel()
    var id: [String: Int] = ["": 0]
    var castList: [Cast] = []
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        viewModel.output = self
        
        collectionViewDesign()
        navigationControllerAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadDetail(id: id)
    }
    
    // MARK: - Funcs
    
    func navigationControllerAppearance() {
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func updateDetailMovie(detail: MovieDetail) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500" + detail.backdropPath!) {
            DispatchQueue.main.async {
                self.imageViewMovie.kf.setImage(with: url)
            }
        }
        labelName.text = detail.title
        labelOriginalName.text = detail.originalTitle
        labelOverview.text = detail.overview
    }
    
    private func updateDetailTVShow(detail: TVShowDetail) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500" + detail.backdropPath!) {
            DispatchQueue.main.async {
                self.imageViewMovie.kf.setImage(with: url)
            }
        }
        labelName.text = detail.name
        labelOriginalName.text = detail.originalName
        labelOverview.text = detail.overview
    }
    
    func collectionViewDesign() {
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        design.minimumLineSpacing = 16
        design.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth
        
        design.itemSize = CGSize(width: itemWidth / 5.5, height: itemWidth / 4)
        
        detailCollectionView.collectionViewLayout = design
    }
}

// MARK: - Extensions

extension DetailPage: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cast = castList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500" + (cast.profilePath ?? "")) {
            DispatchQueue.main.async {
                cell.imageViewCast.kf.setImage(with: url)
            }
        }
        cell.labelCastName.text = cast.name
        
        return cell
    }
}

extension DetailPage: DetailPageViewModelOutput {

    func updateMovieDetail(movieDetail: MovieDetail) {
        updateDetailMovie(detail: movieDetail)
    }
    
    func updateCast(cast: [Cast]) {
        self.castList = cast
        self.detailCollectionView.reloadData()
    }
    
    func updateTVShowDetail(tvShowDetail: TVShowDetail) {
        updateDetailTVShow(detail: tvShowDetail)
    }
}
