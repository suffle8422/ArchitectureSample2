//
//  MainScene.swift
//  ArchitectureSample2
//
//  Created by ionishi on 2025/03/21.
//

import SwiftUI
import SwiftData
import Domain

/// アプリ起動時に表示する画面
/// この画面のみをアプリ本体に公開する
public struct MainScene: View {
    public init() {}

    public var body: some View {
        TodoListScene(state: .init())
            .modelContainer(AppServices.shared.modelContainerManager.modelContainer)
    }
}

