import UIKit
import SwiftUI
import Foundation

struct WithPopover<Content: View, PopoverContent: View>: View {
    @Binding var showPopover: Bool
    var popoverSize: CGSize? = nil
    let content: () -> Content
    let popoverContent: () -> PopoverContent
    var body: some View {
        content()
            .background(
                Wrapper(showPopover: $showPopover, popoverSize: popoverSize, popoverContent: popoverContent)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .frame(width: 0, height: 0)
    }
    struct Wrapper<PopoverContent: View>: UIViewControllerRepresentable {
        @Binding var showPopover: Bool
        let popoverSize: CGSize?
        let popoverContent: () -> PopoverContent
        func makeUIViewController(context: UIViewControllerRepresentableContext<Wrapper<PopoverContent>>) ->
        WrapperViewController<PopoverContent> {
            return WrapperViewController(
                popoverSize: popoverSize,
                popoverContent: popoverContent) {
                    self.showPopover = false
                }
        }
        func updateUIViewController(_ uiViewController: WrapperViewController<PopoverContent>,
                                    context: UIViewControllerRepresentableContext<Wrapper<PopoverContent>>) {
            uiViewController.updateSize(popoverSize)
            if showPopover {
                uiViewController.showPopover()
            } else {
                uiViewController.hidePopover()
            }
        }
    }
    class WrapperViewController<PopoverContent: View>: UIViewController, UIPopoverPresentationControllerDelegate {
        var popoverSize: CGSize?
        let popoverContent: () -> PopoverContent
        let onDismiss: () -> Void
        var popoverVC: UIViewController?
        required init?(coder: NSCoder) { fatalError("") }
        init(popoverSize: CGSize?,
             popoverContent: @escaping () -> PopoverContent,
             onDismiss: @escaping() -> Void) {
            self.popoverSize = popoverSize
            self.popoverContent = popoverContent
            self.onDismiss = onDismiss
            super.init(nibName: nil, bundle: nil)
        }
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        func showPopover() {
            guard popoverVC == nil else { return }
            let vcPopover = UIHostingController(rootView: popoverContent())
            if let size = popoverSize { vcPopover.preferredContentSize = size }
            vcPopover.modalPresentationStyle = UIModalPresentationStyle.popover
            if let popover = vcPopover.popoverPresentationController {
                popover.sourceView = view
                popover.delegate = self
                popover.permittedArrowDirections = []
            }
            popoverVC = vcPopover
            self.present(vcPopover, animated: true, completion: nil)
        }
        func hidePopover() {
            guard let vcPopover = popoverVC, !vcPopover.isBeingDismissed else { return }
            vcPopover.dismiss(animated: true, completion: nil)
            popoverVC = nil
        }
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            popoverVC = nil
            self.onDismiss()
        }
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none   }
        func updateSize(_ size: CGSize?) {
            self.popoverSize = size
            if let vcPopover = popoverVC, let size = size {
                vcPopover.preferredContentSize = size
            }
        }
    }
}
