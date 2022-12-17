//
//  Sequence+asyncForEach.swift
//  StarForge
//
//  Created by Lilliana on 29/11/2022.
//

// forEach doesn't work in async environments, now it does

extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
