import UIKit
import Resolver

class HomeViewController: UIViewController {

    var scrollView: UIScrollView!

    var projectView: ProjectListView!

    var bigProjectTitle: Heading6BoldLabel!
    var bigProjectListView: BigProjectListView!
    var projectListPresenter: ProjectListPresenter!
    var bigProjectListPresenter: BigProjectListPresenter!
    var presenter: HomePresenter!
    var container: Resolver!

    let defaultMargin: CGFloat = .gutter(baseValue: 30)

    init(
        presenter: HomePresenter,
        projectListPresenter: ProjectListPresenter,
        bigProjectListPresenter: BigProjectListPresenter
    ) {
        super.init(nibName: nil, bundle: nil)

        self.presenter = presenter
        self.projectListPresenter = projectListPresenter
        self.bigProjectListPresenter = bigProjectListPresenter
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        buildViews()
    }

}
