//
//  MoviesPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import Foundation

protocol MoviesPageViewModelOutput {
    func updateViewTopRated(list: [String: [Result]])
    func updateViewNowPlaying(list: [String: [Result]])
    func updateViewPopular(list: [String: [Result]])
}

class MoviesPageViewModel {
    
    var repo = Repository()
    var output: MoviesPageViewModelOutput?
    
    init() {
        repo.repoProtocol = self
        uploadMovies()
    }
    
    func uploadMovies() {
        repo.uploadTopRatedMovies()
        repo.uploadNowPlayingMovies()
        repo.uploadPopularMovies()
    }
}

extension MoviesPageViewModel: RepositoryProtocol {

    func uploadTopRated(list: [Result]) {
        self.output?.updateViewTopRated(list: ["1": list])
    }
    
    func uploadNowPlaying(list: [Result]) {
        self.output?.updateViewNowPlaying(list: ["2": list])
    }
    
    func uploadPopular(list: [Result]) {
        self.output?.updateViewPopular(list: ["3": list])
    }
}
