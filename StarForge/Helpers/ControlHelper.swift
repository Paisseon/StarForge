//
//  ControlHelper.swift
//  StarForge
//
//  Created by Lilliana on 08/11/2022.
//

import Foundation

// MARK: - ControlHelper

struct ControlHelper {
    // MARK: Internal

    static func getControls(
        for orders: [Int],
        in _controls: [Control]
    ) -> [Control] {
        let matching: [Control] = _controls.filter {
            orders.contains($0.order)
        }

        return matching
    }

    static func getID(
        for mod: Control
    ) -> String {
        mod.url.lastPathComponent.replacingOccurrences(of: ".tzst", with: "")
    }

    static func getNames(
        for orders: [Int],
        in _controls: [Control]
    ) -> [String] {
        let matching: [Control] = _controls.filter {
            orders.contains($0.order)
        }

        var ret: [String] = []

        matching.forEach { match in
            ret.append(match.name)
        }
        
        for match in matching {
            ret.append(match.name)
        }

        return ret.isEmpty ? ["None"] : ret
    }

    static func getOrders(
        for names: [String],
        in _controls: [Control]
    ) async -> [Int] {
        let matching: [Control] = _controls.filter {
            names.contains($0.name)
        }

        var ret: [Int] = []

        matching.forEach { match in
            ret.append(match.order)
        }

        return ret
    }

    mutating func add(
        _ name: String,
        _ description: String,
        _ author: String,
        _ category: Category,
        _ tier: Tier,
        _ dependencies: [String],
        _ removeFiles: [String],
        _ hasPatch: Bool,
        _ url: String
    ) async {
        let control: Control = await makeControl(
            author,
            name,
            description,
            category,
            tier,
            dependencies,
            removeFiles,
            hasPatch,
            url
        )

        controls.append(control)
        order += 1
    }

    func buildRepo() async {
        var lines: [String] = []

        controls.forEach { control in
            lines.append("[\(control.order)]")
            lines.append("\tauthor s = " + control.author)
            lines.append("\tcategory n = \(control.category.rawValue)")
            lines.append("\tdependencies n[]" + (control.dependencies.isEmpty ? "" : " = " + control.dependencies.map(\.description).joined(separator: ", ")))
            lines.append("\tdescription s = " + control.description)
            lines.append("\thasPatch b = \(control.hasPatch)")
            lines.append("\tname s = " + control.name)
            lines.append("\torder n = \(control.order)")
            lines.append("\tremoveFiles s[]" + (control.removeFiles.isEmpty ? "" : " = " + control.removeFiles.joined(separator: ", ")))
            lines.append("\ttier n = \(control.tier.rawValue)")
            lines.append("\turl s = " + control.url.absoluteString)
        }

        let objGen: String = lines.joined(separator: "\n")

        print(objGen)
    }

    func getURL(
        from string: String
    ) async -> URL {
        .init(
            string: string
                .replacingOccurrences(
                    of: "www.dropbox",
                    with: "dl.dropboxusercontent"
                )
                .dropLast(5)
                .description
        )!
    }

    // MARK: Private

    private var order: Int = 0
    private var controls: [Control] = []

    private func makeControl(
        _ author: String,
        _ name: String,
        _ description: String,
        _ category: Category,
        _ tier: Tier,
        _ _dependencies: [String],
        _ removeFiles: [String],
        _ hasPatch: Bool,
        _ _url: String
    ) async -> Control {
        let dependencies: [Int] = await ControlHelper.getOrders(for: _dependencies, in: controls)
        let url: URL = await getURL(from: _url)

        return Control(
            author: author,
            category: category,
            dependencies: dependencies,
            description: description,
            hasPatch: hasPatch,
            name: name,
            order: order,
            removeFiles: removeFiles,
            tier: tier,
            url: url
        )
    }
}
