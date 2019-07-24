class PromptButton: Button {
	init(){
			super.init()
	}
	override layoutSubviews() {
		self.layer.cornerRadius = self.frame.width / 2
	}
}
