import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: TaskData.entity(), sortDescriptors: [])
    var tasks: FetchedResults<TaskData>
    
    @FetchRequest(entity: SubTaskData.entity(), sortDescriptors: [])
    var subTasks: FetchedResults<SubTaskData>
    
    var body: some View {
        
        NavigationView {
            
            List(tasks) { task in
                
                DisclosureGroup(task.taskName) {
                    
                    // ForEach(task.subTasks) { subTask in
                        // Text(subTask.subTaskName)
                    // }
                    
                }
                
            }
            
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: createTaskButton)
        }
        .navigationViewStyle(.stack)
        
    }
    
    var createTaskButton: some View {
        Button {
            
            let subTask = SubTaskData(context: managedObjectContext)
            subTask.subTaskName = "Sub task name 1"
            subTask.subTaskName = "Sub task name 2"
            subTask.subTaskName = "Sub task name 3"
            
            let task = TaskData(context: managedObjectContext)
            task.taskName = "Task name"
            task.taskSubTasks = [subTask]
            
        } label: {
            Text("Create task")
        }
    }
    
}

