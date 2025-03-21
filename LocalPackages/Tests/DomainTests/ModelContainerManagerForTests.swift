//
//  ModelContainerManagerForTests.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import SwiftData
import Core
import Infrastructure

/// テスト用のModelContainer
/// inMemoryでデータが永続化される
/// 各テストケースで別のModelContainerを生成するため、シングルトンにはしない
final class ModelContainerManagerForTests: ModelContainerManagerProtocol {
    package let modelContainer: ModelContainer

    init() {
        let schema = Schema([TodoModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
    }
}
