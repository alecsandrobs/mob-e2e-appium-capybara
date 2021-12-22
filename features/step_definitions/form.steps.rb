actions = Actions.new
page = GenericPage.new

When('he fills the text field {string} with {string}') do |field, text|
    page.field_named(field).send_keys(text)
end

When('he selects on combo console the option {string}') do |text|
    actions.tap(page.id('android:id/text1'))
    actions.tap(page.compo_option(text))
end

When('he clicks on checkbox') do
    actions.tap(page.check_box)
end

When('he clicks on button {string}') do |text|
    actions.tap(page.button_named(text))
end

Then('he sees the texts bellow') do |table|
    sleep 0.5
    table.raw.each do |row|
        expect(page.text_view(row[0])).to be_displayed
    end
end