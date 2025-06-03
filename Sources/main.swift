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
            print("[\(index)] \(status) \(task.title)")

        }
    }
}

var tasks: [Task] = [
    Task(title: "Task 1", isDone: true),
    Task(title: "Task 2", isDone: false),
]

@MainActor func addTask() {
    print("Enter task title: ")
    if let input = readLine(), !input.isEmpty {
        let newTask = Task(title: input, isDone: false)
        tasks.append(newTask)
    } else {
        print("Invalid input")
    }
}

@MainActor func markAsDone() {
    listTasks(tasks: tasks)
    print("Enter the index of a task to mark as done: ")

    guard let input = readLine(), let index = Int(input), index >= 0, index < tasks.count else {
        print("Invalid value")
        return
    }

    tasks[index].isDone = true
    print("Task with \(index) mark as done")
}

@MainActor func deleteTask() {
    listTasks(tasks: tasks)
    print("Enter the index of a task to delete: ")

    guard let input = readLine(), let index = Int(input), index >= 0, index < tasks.count else {
        print("Invalid value")
        return
    }

    let removed = tasks.remove(at: index)
    print("Deleted: \(removed.title)")
}

addTask()
markAsDone()
listTasks(tasks: tasks)
