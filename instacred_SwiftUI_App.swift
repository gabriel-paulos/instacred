//
//  instacred_SwiftUI_App.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-03.
//
import SwiftUI
import RealmSwift
import Combine

//let app = App(id: "instacred-61393c97bb02144973ab0328")


@main
struct instacred_SwiftUI_App: SwiftUI.App {
    //@StateObject var state = AppState()
    @ObservedObject var page = Hold()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader{ geometry in

                if page.nowScreen == Screens.Tabs{
                    feedContainer(screenWidth: geometry.size.width)
                        .environmentObject(page)
                }
                else{
                    DetailsContainer(screenWidth: geometry.size.width)
                        .environmentObject(page)
                }
            }
        }
    }
}

class Hold: ObservableObject {
    
    @Published var nowScreen: Screens = Screens.Tabs
    @Published var prevScreen: Screens = Screens.Details
    @Published var colwidth: CGFloat = 0
    @Published var colhalf: CGFloat = 0
    @Published var opt: Options = Options(purchase: "0", amount: 0, store: "", dueDate: "1/1/2020")
    @Published var prevView: Int = 2
    //@Published var postAlert: PersonShown = PersonShown(name: "", post: Post(bor: false,amo: -1,interest: -1, dur: -1))
    
    func setCurrentScreen(){
        
        let curr = self.nowScreen
        self.nowScreen = self.prevScreen
        self.prevScreen = curr
    }
    
    func setColwidth(screenWidth: CGFloat){
        self.colwidth = screenWidth / 3
        self.colhalf = screenWidth / 2
    }
    
    func setOptions(opt: Options){
        
        self.opt.amount = opt.amount
        self.opt.dueDate = opt.dueDate
        self.opt.purchase = opt.purchase
        self.opt.store = opt.store

    }
    
//    func setPostAlert(pos: Post, name: String){
//        
//        self.postAlert.post.amount = pos.amount
//        self.postAlert.post.borrow = pos.borrow
//        self.postAlert.post.duration = pos.duration
//        self.postAlert.post.interest = pos.interest
//        self.postAlert.name = name
//    }
    
    func setPrivView(prev: Int){
        
        self.prevView = prev
    }
    
}

enum Screens{
    case Tabs
    case Details
}
//
//class AppState: ObservableObject{
//
//    var loginPublisher = PassthroughSubject<RealmSwift.User,Error>()
//    var logoutPublisher = PassthroughSubject<Void,Error>()
//    var userRealmPublisher = PassthroughSubject<Realm,Error>()
//    var cancellables = Set<AnyCancellable>()
//
//    @Published var shouldIndicateActivity = false
//    @Published var error: String?
//
//    var user: User?
//
//    var loggedIn: Bool {
//            app.currentUser != nil && app.currentUser?.state == .loggedIn && user != nil
//        }
//
//    init() {
//
//            loginPublisher
//                .receive(on: DispatchQueue.main)
//                .flatMap { user -> RealmPublishers.AsyncOpenPublisher in
//                    self.shouldIndicateActivity = true
//                    let realmConfig = user.configuration(partitionValue: "user=\(user.id)")
//                    return Realm.asyncOpen(configuration: realmConfig)
//                }
//                .receive(on: DispatchQueue.main)
//                .map {
//                    self.shouldIndicateActivity = false
//                    return $0
//                }
//                .subscribe(userRealmPublisher)
//                .store(in: &self.cancellables)
//
//            userRealmPublisher
//                .sink(receiveCompletion: { result in
//                    if case let .failure(error) = result {
//                        self.error = "Failed to log in and open realm: \(error.localizedDescription)"
//                    }
//                }, receiveValue: { realm in
//                    print("Realm User file location: \(realm.configuration.fileURL!.path)")
//                    self.user = realm.objects(User.self).first
//                })
//                .store(in: &cancellables)
//
//            logoutPublisher
//                .receive(on: DispatchQueue.main)
//                .sink(receiveCompletion: { _ in
//                }, receiveValue: { _ in
//                    self.user = nil
//                })
//                .store(in: &cancellables)
//        }
//
//
//}
