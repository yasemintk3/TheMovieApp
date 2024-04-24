//
//  TVShowsPageViewModel.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 24.04.2024.
//

import Foundation

protocol TVShowsPageViewModelOutput {
    func updateViewTopRated(list: [String: [ResultTVShows]])
    func updateViewPopular(list: [String: [ResultTVShows]])
}

class TVShowsPageViewModel {
    
    var repo = Repository()
    var output: TVShowsPageViewModelOutput?
    
    init() {
        repo.repoProtocolTVShows = self
        uploadTVShows()
    }
    
    func uploadTVShows() {
        repo.uploadTopRatedTVShows()
        repo.uploadPopularTVShows()
    }
}

extension TVShowsPageViewModel: RepositoryProtocolTVShows {
    func uploadTopRated(list: [ResultTVShows]) {
        self.output?.updateViewTopRated(list: ["1": list])
    }
    
    func uploadPopular(list: [ResultTVShows]) {
        self.output?.updateViewTopRated(list: ["2": list])
    }
}
