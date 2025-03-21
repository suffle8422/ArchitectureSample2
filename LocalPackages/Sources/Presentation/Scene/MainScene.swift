//
//  MainScene.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import SwiftUI
import SwiftData
import Domain

public struct MainScene: View {
    public init() {}

    public var body: some View {
        TodoListScene(state: .init())
            .modelContainer(AppServices.shared.modelContainerManager.modelContainer)
    }
}

