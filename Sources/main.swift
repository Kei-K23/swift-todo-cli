import Foundation

struct Task {
    var title: String
    var isDone: Bool
}

func listTasks(tasks: [Task]) {
    if tasks.isEmpty {
        print("No tasks yet.")
    } else {
        for (index, task) in tasks.enumerated() {
            let status = task.isDone ? "✅" : "🕐"
            print("[\(index + 1)] \(status) \(task.title)")

        }
    }
}

var sampleTasks: [Task] = [
    Task(title: "Task 1", isDone: true),
    Task(title: "Task 2", isDone: false),
]

listTasks(tasks: sampleTasks)
