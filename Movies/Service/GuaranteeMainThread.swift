//
//  File.swift
//  Movies
//
//  Created by Berat Yavuz on 24.08.2022.
//

import Foundation

func guaranteeMainThread (_ work: @escaping ()-> Void) {
    if Thread.isMainThread {
        work()
    }
    else {
        DispatchQueue.main.async(
        execute: work
        )
    }
}
