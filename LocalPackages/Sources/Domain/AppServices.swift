//
//  AppServices.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import Infrastructure
import Core

/// Repository及びServiceを管理するクラス
/// Presetation層から利用される
package final class AppServices: Sendable {
    package static let shared = AppServices()
    package let modelContainerManager = ModelContainerManager.shared
    package let todoService: any TodoServiceProtocol

    private init() {
        let todoRepository = TodoRepository(modelContainer: modelContainerManager.modelContainer)
        todoService = TodoService(todoRepository: todoRepository)
    }
}
