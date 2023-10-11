import Foundation

final class ApplicationLifeCycleManager: ObservableObject {
    
    @Published private (set) var state: ApplicationLifeCycleState
    static let shared: ApplicationLifeCycleManager = .init()
    
    init(state: ApplicationLifeCycleState = .didFinishLaunching) {
        self.state = state
        
        ApplicationLifeCycleState.allCases.forEach { state in
            NotificationCenter.default.addObserver(self, selector: #selector(appliactionLifeCycleChanged(notification:)), name: state.notificationName, object: nil)
        }
    
    }
    
    @objc func appliactionLifeCycleChanged(notification: Notification) {
        guard let newState: ApplicationLifeCycleState = ApplicationLifeCycleState(notificationName: notification.name) else { return }
        print("\(#function) - \(newState)")
        Task {
            await MainActor.run {
                self.state = newState
            }
        }
    }
}
