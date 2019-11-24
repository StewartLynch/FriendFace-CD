//
//  NetworkService.swift
//  FriendFace
//
//  Created by Stewart Lynch on 11/22/19.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import Foundation

//  This structure uses static functions so that I can call the functions from anywhere in my code.  The purpose
//  of doing it this way is because it creates a namespace 'Network' so all static functions are accessible
//  simply by starting typing Network. and code completion will reveal the available static functions
//  I chose an enum but it could just as easily been a struct or class

enum Network {
    static func getUsers(from urlString: String, completion: @escaping ([User]?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    static func fetchGenericJSONData<T: Decodable>(urlString: String, completion:@escaping (T?,Error?) -> ()) {
            guard let url = URL(string: urlString) else { fatalError("Invalid URL")}
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    completion(nil,err)
                    return
                }
                guard let data = data else {fatalError("Invalid data")}
                do {
                    let objects = try JSONDecoder().decode(T.self, from: data)
                    completion(objects,nil)
                } catch let err {
                    print(err)
                    completion(nil,err)
                }
                }.resume()
        }
}
