# mob-e2e-appium-capybara
Mobile end-to-end testing with Appium + Capybara (Ruby)

### Requirements
* node and npm
* allure-command | `npm install -g allure-commandline`


Run tests
```
cucumber
```

Open report
```
allure serve report/
```

Running with rake, just `rake` comand + `task name` eg:
```
rake test_report
```
or
```
TAGS=@Form rake tags
```