//
//  Repository.swift
//  TheMovieApp
//
//  Created by Yasemin TOK on 22.04.2024.
//

import Foundation
import Alamofire

protocol RepositoryProtocol {
    func uploadTopRated(list: [Result])
    func uploadNowPlaying(list: [Result])
    func uploadPopular(list: [Result])
}

class Repository {
    
    var repoProtocol: RepositoryProtocol?
    
    func uploadTopRatedMovies() {
        
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=7bc5ca927db5991f5c55259703847712", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(Movies.self, from: data)
                    if let list = answer.results {
                        self.repoProtocol?.uploadTopRated(list: list)
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
                        self.repoProtocol?.uploadNowPlaying(list: list)
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
                        self.repoProtocol?.uploadPopular(list: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
