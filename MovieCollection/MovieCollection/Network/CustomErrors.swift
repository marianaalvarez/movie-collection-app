//
//  CustomErrors.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 11/11/2024.
//

import Foundation

enum CustomError: Error {
    case connectionError
    case invalidStatusCode
    case parseError
    case movieNotFoundError
}
