//
//  Repository.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import Foundation
import Alamofire

protocol RepositoryProtocolMovies {
    func uploadTopRated(list: [ResultMovies])
    func uploadNowPlaying(list: [ResultMovies])
    func uploadPopular(list: [ResultMovies])
}

protocol RepositoryProtocolTVShows {
    func uploadTopRated(list: [ResultTVShows])
    func uploadPopular(list: [ResultTVShows])
}

class Repository {
    
    var repoProtocolMovies: RepositoryProtocolMovies?
    var repoProtocolTVShows: RepositoryProtocolTVShows?
    
    func uploadTopRatedMovies() {
        
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(Movies.self, from: data)
                    if let list = answer.results {
                        self.repoProtocolMovies?.uploadTopRated(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadNowPlayingMovies() {
        
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(Movies.self, from: data)
                    if let list = answer.results {
                        self.repoProtocolMovies?.uploadNowPlaying(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadPopularMovies() {
        
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(Movies.self, from: data)
                    if let list = answer.results {
                        self.repoProtocolMovies?.uploadPopular(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadTopRatedTVShows() {
        
        AF.request("https://api.themoviedb.org/3/tv/top_rated?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(TVShows.self, from: data)
                    if let list = answer.results {
                        self.repoProtocolTVShows?.uploadTopRated(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadPopularTVShows() {
        
        AF.request("https://api.themoviedb.org/3/tv/popular?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(TVShows.self, from: data)
                    if let list = answer.results {
                        self.repoProtocolTVShows?.uploadPopular(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
