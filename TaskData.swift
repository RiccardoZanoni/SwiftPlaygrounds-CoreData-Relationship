import CoreData

@objc(TaskData)
class TaskData: NSManagedObject, Identifiable {
    @NSManaged var taskName: String
    @NSManaged var taskSubTasks: // What I have to write here?
}
