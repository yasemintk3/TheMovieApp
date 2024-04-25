//
//  DetailPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import Foundation

protocol DetailPageViewModelOutput {
    func updateMovieDetail(movieDetail: MovieDetail)
    func updateMovieCast(movieCast: [Cast])
    func updateTVShowDetail(tvShowDetail: TVShowDetail)
    func updateTVShowCast(tvShowCast: [Cast])
}

class DetailPageViewModel {
    
    // MARK: - Properties
    
    var repo = Repository()
    var output: DetailPageViewModelOutput?
    
    // MARK: - Initialization
    
    init() {
        repo.repoProtocolDetailMovie = self
        repo.repoProtocolDetailTVShow = self
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

extension DetailPageViewModel: RepositoryProtocolDetailMovie {

    func uploadMovieDetail(movieDetail: MovieDetail) {
        self.output?.updateMovieDetail(movieDetail: movieDetail)
    }
    
    func uploadMovieCast(movieCast: [Cast]) {
        self.output?.updateMovieCast(movieCast: movieCast)
    }
}

extension DetailPageViewModel: RepositoryProtocolDetailTVShow {
    
    func uploadTVShowDetail(tvShowDetail: TVShowDetail) {
        self.output?.updateTVShowDetail(tvShowDetail: tvShowDetail)
    }
    
    func uploadTVShowCast(tvShowCast: [Cast]) {
        self.output?.updateTVShowCast(tvShowCast: tvShowCast)
    }
}
