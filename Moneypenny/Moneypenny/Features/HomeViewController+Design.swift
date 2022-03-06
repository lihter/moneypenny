import SnapKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        addChild(projectListViewController)
        view.addSubview(projectListViewController.view)
    }

    func styleViews() {
        view.backgroundColor = .white
    }

    func defineLayoutForViews() {
        projectListViewController.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

}
