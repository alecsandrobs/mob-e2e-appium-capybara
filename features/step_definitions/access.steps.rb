actions = Actions.new
page = GenericPage.new

Given('that John access the feature {string}') do |text|
    actions.tap(page.text_view(text))
    sleep 0.5
end