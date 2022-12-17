//
//  StarForgeError.swift
//  StarForge
//
//  Created by Lilliana on 17/11/2022.
//

enum StarForgeError: Error {
    case ddlFailed
    case ipaInvalid
    case notFound
    case tarNotFound
    case tarCorrupt
    case tarBlockSize
    case permission
}
