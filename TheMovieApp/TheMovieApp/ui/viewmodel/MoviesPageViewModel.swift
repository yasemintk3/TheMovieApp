//
//  MoviesPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import Foundation

protocol MoviesPageViewModelOutput {
    func updateViewTopRated(list: [String: [ResultMovies]])
    func updateViewNowPlaying(list: [String: [ResultMovies]])
    func updateViewPopular(list: [String: [ResultMovies]])
}

class MoviesPageViewModel {
    
    var repo = Repository()
    var output: MoviesPageViewModelOutput?
    
    init() {
        repo.repoProtocolMovies = self
        uploadMovies()
    }
    
    func uploadMovies() {
        repo.uploadTopRatedMovies()
        repo.uploadNowPlayingMovies()
        repo.uploadPopularMovies()
    }
}

extension MoviesPageViewModel: RepositoryProtocolMovies {

    func uploadTopRated(list: [ResultMovies]) {
        self.output?.updateViewTopRated(list: ["1": list])
    }
    
    func uploadNowPlaying(list: [ResultMovies]) {
        self.output?.updateViewNowPlaying(list: ["2": list])
    }
    
    func uploadPopular(list: [ResultMovies]) {
        self.output?.updateViewPopular(list: ["3": list])
    }
}
