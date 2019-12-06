//
//  News.swift
//  Ikou
//
//  Created by Salgara on 12/3/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation
import RealmSwift

struct News: Codable{
    
    var appid: Int?
    var gid: String?
    var title: String?
    var url: String?
    var is_external_url: Bool?
    var author: String?
    var contents: String?
    var feedlabel: String?
    var date: Int?
    var feedname: String?
    var feed_type: Int?
    
    enum CodingKeys: CodingKey{
        case appid
        case gid
        case title
        case url
        case is_external_url
        case author
        case contents
        case feedlabel
        case date
        case feedname
        case feed_type
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.appid = try? container?.decode(Int.self, forKey: .appid)
        self.gid = try? container?.decode(String.self, forKey: .gid)
        self.title = try? container?.decode(String.self, forKey: .title)
        self.url = try? container?.decode(String.self, forKey: .url)
        self.is_external_url = try? container?.decode(Bool.self, forKey: .is_external_url)
        self.author = try? container?.decode(String.self, forKey: .author)
        self.contents = try? container?.decode(String.self, forKey: .contents)
        self.feedlabel = try? container?.decode(String.self, forKey: .feedlabel)
        self.date = try? container?.decode(Int.self, forKey: .date)
        self.feedname = try? container?.decode(String.self, forKey: .feedname)
        self.feed_type = try? container?.decode(Int.self, forKey: .feed_type)
    }
    
    init(object: NewsObject){
        self.appid = object.appid
        self.gid = object.gid
        self.title = object.title
        self.url = object.url
        self.is_external_url = object.is_external_url
        self.author = object.author
        self.contents = object.contents
        self.feedlabel = object.feedlabel
        self.date = object.date
        self.feedname = object.feedname
        self.feed_type = object.feed_type
    }
    func object() -> NewsObject{
        let object = NewsObject()
        object.appid = appid ?? 0
        object.gid = gid ?? ""
        object.title = title ?? ""
        object.url = url ?? ""
        object.is_external_url = is_external_url == false
        object.author = author ?? ""
        object.contents = contents ?? ""
        object.feedlabel = feedlabel ?? ""
        object.date = date ?? 0
        object.feedname = feedname ?? ""
        object.feed_type = feed_type ?? 0
        return object
    }
    
}

class NewsObject: Object{
    
    @objc dynamic var appid: Int = 0
    @objc dynamic var gid: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var is_external_url: Bool = false
    @objc dynamic var author: String = ""
    @objc dynamic var contents: String = ""
    @objc dynamic var feedlabel: String = ""
    @objc dynamic var date: Int = 0
    @objc dynamic var feedname: String = ""
    @objc dynamic var feed_type: Int = 0

    override class func primaryKey() -> String? {
        return "title"
    }
    
}
