//
//  MoviesPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import Foundation

protocol MoviesPageViewModelOutput {
    func updateViewTopRatedMovie(list: [String: [ResultMovies]])
    func updateViewNowPlayingMovie(list: [String: [ResultMovies]])
    func updateViewPopularMovie(list: [String: [ResultMovies]])
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
        self.output?.updateViewTopRatedMovie(list: ["1": list])
    }
    
    func uploadNowPlaying(list: [ResultMovies]) {
        self.output?.updateViewNowPlayingMovie(list: ["2": list])
    }
    
    func uploadPopular(list: [ResultMovies]) {
        self.output?.updateViewPopularMovie(list: ["3": list])
    }
}
