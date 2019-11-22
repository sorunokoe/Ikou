//
//  ImageHelper.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import UIKit

protocol ImageHelperProtocol{
    func getImageBy(url: String, completion: @escaping ((UIImage) -> Void))
}
class ImageHelper: ImageHelperProtocol{
    func getImageBy(url: String, completion: @escaping ((UIImage) -> Void)) {
        guard let url = URL(string: url) else { return }
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
