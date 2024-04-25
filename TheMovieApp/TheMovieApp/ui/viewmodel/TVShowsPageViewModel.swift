//
//  TVShowsPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import Foundation

protocol TVShowsPageViewModelOutput {
    func updateViewTopRatedTV(list: [String: [ResultTVShows]])
    func updateViewPopularTV(list: [String: [ResultTVShows]])
}

class TVShowsPageViewModel {
    
    // MARK: - Properties
    
    var repo = Repository()
    var output: TVShowsPageViewModelOutput?
    
    // MARK: - Initialization
    
    init() {
        repo.repoProtocolTVShows = self
        uploadTVShows()
    }
    
    // MARK: - Funcs
    
    func uploadTVShows() {
        repo.uploadTopRatedTVShows()
        repo.uploadPopularTVShows()
    }
}

// MARK: - Extensions

extension TVShowsPageViewModel: RepositoryProtocolTVShows {
    
    func uploadTopRated(list: [ResultTVShows]) {
        self.output?.updateViewTopRatedTV(list: ["1": list])
    }
    
    func uploadPopular(list: [ResultTVShows]) {
        self.output?.updateViewPopularTV(list: ["2": list])
    }
}
