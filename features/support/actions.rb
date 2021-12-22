class Actions

    def tap(element)
        Appium::TouchAction.new.tap(element: element, x:0.0, y:0.0).perform()
    end

    def select(element, value)
        tap(element)
        tap(value)
    end

end