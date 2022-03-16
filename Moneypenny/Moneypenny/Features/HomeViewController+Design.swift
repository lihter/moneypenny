import SnapKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        addChild(bigProjectListViewController)
        view.addSubview(bigProjectListViewController.view)

        addChild(projectListViewController)
        view.addSubview(projectListViewController.view)
    }

    func styleViews() {
        view.backgroundColor = .white

        bigProjectListViewController.view.backgroundColor = .gray
        projectListViewController.view.backgroundColor = .blue
    }

    func defineLayoutForViews() {
        bigProjectListViewController.view.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }

        projectListViewController.view.snp.makeConstraints {
            $0.top.equalTo(bigProjectListViewController.view.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

}
