//
//  TodoListSceneState.swift
//  ArchitectureSample
//
//  Created by ionishi on 2024/11/30.
//

import Foundation
import Observation
import Core
import Domain

@MainActor
@Observable
final class TodoListSceneState {
    @ObservationIgnored let todoService: any TodoServiceProtocol
    var todos = [TodoDTO]()

    init(todoService: any TodoServiceProtocol = AppServices.shared.todoService) {
        self.todoService = todoService
    }

    func fetchTodos() async {
        todos = await todoService.fetch()
    }

    func insertTodo() async {
        let todo = TodoDTO(
            id: UUID(),
            title: Date().formattedString,
            detail: "詳細情報",
            isFinish: false
        )
        await todoService.insert(dto: todo)
        todos = await todoService.fetch()
    }
}
