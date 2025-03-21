//
//  ModelContainerManager.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Core
import SwiftData

package final class ModelContainerManager: ModelContainerManagerProtocol {
    package static let shared = ModelContainerManager()
    package let modelContainer: ModelContainer

    private init() {
        let schema = Schema([TodoModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
    }
}
