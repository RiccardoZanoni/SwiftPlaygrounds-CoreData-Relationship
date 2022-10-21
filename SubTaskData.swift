import CoreData

@objc(SubTaskData)
class SubTaskData: NSManagedObject, Identifiable {
    @NSManaged var subTaskName: String
}
