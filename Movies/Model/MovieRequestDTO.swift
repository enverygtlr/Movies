//
//  MovieRequestDTO.swift
//  Movies
//
//  Created by Berat Yavuz on 25.08.2022.
//

import Foundation

public struct MovieRequestDTO {
    public let search: String?
    public let contentType: String?
    
    public init (search: String?, contentType: String) {
        self.search = search
        self.contentType = contentType
    }
}
