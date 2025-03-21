//
//  TodoListScene.swift
//  ArchitectureSample
//
//  Created by ionishi on 2024/11/30.
//

import SwiftUI
import Core

struct TodoListScene: View {
    @State var state: TodoListSceneState

    var body: some View {
        NavigationStack {
            todoListView()
                .navigationTitle("TODOリスト")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(
                            action: {
                                Task { await state.insertTodo() }
                            },
                            label: { Image(systemName: "plus")}
                        )
                    }
                }
                .onAppear {
                    Task { await state.fetchTodos() }
                }
        }
    }
}

private extension TodoListScene {
    func todoListView() -> some View {
        List(state.todos, id: \.self) { todo in
            NavigationLink(destination: {
                TodoDetailScene(state: .init(model: todo))
            }, label: {
                Text(todo.title)
                    .strikethrough(todo.isFinish)
            })
        }
    }
}

#Preview {
    TodoListScene(
        state: TodoListSceneState(
            todoService: MockTodoService()
        )
    )
}
