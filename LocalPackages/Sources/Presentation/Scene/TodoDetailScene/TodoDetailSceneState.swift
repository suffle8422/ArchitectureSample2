//
//  TodoDetailSceneState.swift
//  ArchitectureSample
//
//  Created by ionishi on 2024/12/01.
//

import SwiftUI
import Observation
import Core
import Domain

@MainActor
@Observable
final class TodoDetailSceneState {
    @ObservationIgnored let todoService: any TodoServiceProtocol
    var model: TodoDTO

    var isShownDeleteAlert = false

    package init(
        model: TodoDTO,
        todoService: any TodoServiceProtocol = AppServices.shared.todoService
    ) {
        self.model = model
        self.todoService = todoService
    }

    func toggleFinishFlg() async {
        let updatedTodo = TodoDTO(
            id: model.id,
            title: model.title,
            detail: model.detail,
            isFinish: !model.isFinish
        )
        await todoService.update(dto: updatedTodo)
        model = updatedTodo
    }

    func deleteTodo() async {
        await todoService.delete(id: model.id)
    }
}
