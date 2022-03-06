import Combine
import Foundation

class HomePresenter {

    private let router: AppRouter!

    var viewModels: AnyPublisher<[ProjectViewModel], Never> {
        let mocked = ProjectViewModel(
            id: 1,
            title: "The Bullish Bulls",
            imageUrl: URL(string: "https://pbs.twimg.com/profile_images/1490819506477965312/Yis89Ixm.jpg"))
        let mocked2 = ProjectViewModel(
            id: 2,
            title: "Antisocial Ape Club",
            imageUrl: URL(string: "https://pbs.twimg.com/profile_images/1479975894294876162/OWA7RSNi.jpg"))
        let mocked3 = ProjectViewModel(
            id: 3,
            title: "Secret Skellies Society",
            imageUrl: URL(string: "https://pbs.twimg.com/profile_images/1499400037377273863/cOuu2J0f.jpg"))

        return Just([mocked, mocked2, mocked3])
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }

    init(router: AppRouter) {
        self.router = router
    }

}
