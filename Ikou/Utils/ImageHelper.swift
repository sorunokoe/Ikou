//
//  ImageHelper.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

enum ImageType{
    case avatar(url: String)
    case ownedGame(appid: String, hash: String)
}
extension ImageType{
    var imageUrl: URL?{
        switch self {
        case .avatar(let url):
            return URL(string: url)
        case .ownedGame(let appid, let hash):
            let url = "http://media.steampowered.com/steamcommunity/public/images/apps/\(appid)/\(hash).jpg"
            return URL(string: url)
        }
    }
}
class ImageHelper{
    
    static var shared = ImageHelper()
    
    func getImageBy(url: ImageType, completion: @escaping ((UIImage) -> Void)) {
        guard let url = url.imageUrl else { return }
        getData(from: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async{
                if let image = UIImage(data: data){
                    completion(image)
                }
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
