import UIKit

extension UIEdgeInsets {

    static func insets(
        left: CGFloat = .zero,
        right: CGFloat = .zero,
        top: CGFloat = .zero,
        bottom: CGFloat = .zero
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

}
