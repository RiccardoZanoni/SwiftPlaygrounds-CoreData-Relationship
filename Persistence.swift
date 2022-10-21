class Persistence {

    static let shared = Persistence()
    
    static let previewFull: Persistence = {
        let result = Persistence(inMemory: true)
        let context = result.container.viewContext
        for i in 0 ..< 5 {
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        
        let taskData = NSEntityDescription()
        taskData.name = "taskData"
        taskData.managedObjectClassName = "TaskData"
        
        let taskName = NSAttributeDescription()
        taskName.name = "taskName"
        taskName.type = .string
        taskData.properties.append(taskName)
        
        let subTaskData = NSEntityDescription()
        subTaskData.name = "subTaskData"
        subTaskData.managedObjectClassName = "SubTaskData"
        
        let subTaskName = NSAttributeDescription()
        subTaskName.name = "subTaskName"
        subTaskName.type = .string
        subTaskData.properties.append(subTaskName)
        
        let model = NSManagedObjectModel()
        model.entities = [taskData, subTaskData]
        
        let container = NSPersistentContainer(name: "My App", managedObjectModel: model)
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        self.container = container
    }
}
