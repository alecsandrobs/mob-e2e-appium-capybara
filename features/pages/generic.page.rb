class GenericPage

    def button_named(text)
        $driver.find_element(GenericPageMap.new.button_named(text))
    end

    def check_box(index = 1)
        $driver.find_elements(GenericPageMap.new.check_box())[index - 1]
    end

    def id(id)
        $driver.find_element(GenericPageMap.new.id(id))
    end

    def compo_option(text)
        $driver.find_element(GenericPageMap.new.combo_option(text))
    end

    def field_named(text)
        $driver.find_element(GenericPageMap.new.field_named(text))
    end

    def text_view(text)
        $driver.find_element(GenericPageMap.new.text_view(text))
    end

end

class GenericPageMap

    def id(id)
        { id: id }
    end

    def combo_option(text)
        { xpath: "//android.widget.CheckedTextView[@text='#{text}']" }
    end

    def button_named(text)
        { xpath: "//android.widget.Button/android.widget.TextView[@text='#{text}']" }
    end

    def check_box()
        { xpath: '//android.widget.CheckBox' }
    end
    
    def field_named(text)
        { xpath: "//android.widget.EditText[@text='#{text}']" }
    end

    def text_view(text)
        { xpath: "//android.widget.TextView[@text='#{text}']" }
    end

end