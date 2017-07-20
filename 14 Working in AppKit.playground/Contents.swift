import AppKit
import PlaygroundSupport

final class CustomView: NSView {
	override func draw(_ dirtyRect: NSRect) {
		guard let context = NSGraphicsContext.current()?.cgContext else { return }

		NSColor.white.setFill()
		context.fill(bounds)

		NSColor.blue.setFill()
		context.fill(CGRect(x: 20, y: 20, width: 150, height: 150))

		let text = "Hello" as NSString
		text.draw(at: CGPoint(x: 20, y: 190), withAttributes: [:])
	}

	override var isFlipped: Bool {
		return true
	}
}

let view = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
view.wantsLayer = true
view.layer

PlaygroundPage.current.liveView = view

let image = NSImage(size: CGSize(width: 320, height: 320), flipped: true) { bounds in
	guard let context = NSGraphicsContext.current()?.cgContext else { return false }

	NSColor.white.setFill()
	context.fill(bounds)

	NSColor.blue.setFill()
	context.fill(CGRect(x: 20, y: 20, width: 150, height: 150))

	let text = "Hello" as NSString
	text.draw(at: CGPoint(x: 20, y: 190), withAttributes: [:])

	return true
}

image
