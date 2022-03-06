import UIKit

public class Heading9Label: UILabel {

    public override var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            styleViews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleViews()
    }

    private func styleViews() {
        font = .heading9
    }

}
