import Foundation

struct ProjectViewModel {

    let id: Int
    let title: String
    let imageUrl: URL?

}

extension ProjectViewModel: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: ProjectViewModel, rhs: ProjectViewModel) -> Bool {
        lhs.id == rhs.id
    }

}
