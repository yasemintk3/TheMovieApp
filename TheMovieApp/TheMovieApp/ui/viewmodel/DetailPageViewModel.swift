//
//  DetailPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import Foundation

protocol DetailPageViewModelOutput {
    func updateMovieDetail(movieDetail: MovieDetail)
    func updateCast(cast: [Cast])
    func updateTVShowDetail(tvShowDetail: TVShowDetail)
}

class DetailPageViewModel {
    
    // MARK: - Properties
    
    var repo = Repository()
    var output: DetailPageViewModelOutput?
    
    // MARK: - Initialization
    
    init() {
        repo.repoProtocolDetail = self
    }
    
    // MARK: - Funcs
    
    func uploadDetail(id: [String: Int]) {
        
        for (key, value) in id {
            switch key {
            case "movie":
                repo.uploadMovieDetail(id: value)
                repo.uploadMovieCast(id: value)
                
            case "tvShow":
                repo.uploadTVShowDetail(id: value)
                repo.uploadTVShowCast(id: value)

            default:
                break
            }
        }
    }
}

// MARK: - Extensions

extension DetailPageViewModel: RepositoryProtocolDetail {

    func uploadMovieDetail(movieDetail: MovieDetail) {
        self.output?.updateMovieDetail(movieDetail: movieDetail)
    }
    
    func uploadCast(cast: [Cast]) {
        self.output?.updateCast(cast: cast)
    }
    
    func uploadTVShowDetail(tvShowDetail: TVShowDetail) {
        self.output?.updateTVShowDetail(tvShowDetail: tvShowDetail)
    }
}
