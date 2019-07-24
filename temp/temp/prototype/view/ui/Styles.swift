import Foundation
@testable import Utils

extension ProtoTypeView{
    enum Styles{
        enum ModalButton{
            enum SVGGraphicData{
                static let names:[String] = ["","calculator","bolt","eye"]
            }
            static func initial(_ i:Int) -> String {
                let svgName:String = SVGGraphicData.names[i]
                var css:String = ""
                css += "ModalButton{"
                css += "fill:#\(Colors.Modal.initial(i).hexString),~/Desktop/\(svgName).svg white;"//fill:blue;
                css += "fill-alpha:1.0,1.0;"
                css += "width:\(Modal.initial().w)px,\(Modal.svgSize.w)px;"
                css += "height:\(Modal.initial().h)px,\(Modal.svgSize.h)px;"
                css += "corner-radius:\(Modal.initial().fillet)px;"
                css += "margin-top:0px,\(Modal.svgSize.w/2)px;"
                css += "margin-left:0px,\(Modal.svgSize.w/2)px;"
                css += "clear:none;"
                css += "float:none;"
                css += "}"
                return css
            }
        }
        enum PromptButton{
            static let initial:String = {
                var css:String = ""
                /*TextButton down Text*/
                
                css += "TextButton{"
                css += "width:\(ProtoTypeView.PromptButton.initial.size.w)px;"
                css += "height:\(ProtoTypeView.PromptButton.initial.size.h)px;"
                css += "fill:\(Colors.PromptButton.Background.idle.hexString);"
                css += "corner-radius:\(ProtoTypeView.PromptButton.initial.size.h/2)px;"
                css += "clear:none;"
                css += "float:none;"
                css += "}"
                /*TextButton down*/
                css += "TextButton:down{"
                css += "fill:black;"
                css += "}"
                /*TextButton Text*/
                css += "TextButton Text{"
                css += "float:left;"
                css += "clear:left;"
                css += "width:100%;"
                css += "height:40px;"
                css += "margin-top:8px;"
                css += "font:Helvetica Neue;"
                css += "size:24px;"
                css += "wordWrap:true;"
                css += "type:dynamic;"
                css += "background:false;"
                css += "backgroundColor:yellow;"
                css += "border:false;"
                css += "align:center;"
                css += "color:#\(Colors.PromptButton.Text.idle.hexString);"//
                css += "selectable:false;"
                css += "multiline:false;"
                css += "}"
                css += "TextButton:down:over Text:down:over{"
                css += "color:#\(Colors.PromptButton.Text.down.hexString);"//
                css += "}"
                return css
            }()
        }
        static let window:String = {
            return "Window{fill:white;}"
        }()
    }
}
