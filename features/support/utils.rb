require 'report_builder'

class Util

    def save_image(name_image = "imagem")
        path_image = File.join(FileUtils.pwd(), "report")
        FileUtils.makedirs(path_image)
        file_name = path_image + "/#{name_image}.png".tr(' ', '_').downcase
        save_screenshot(file_name)
        file = File.open(file_name)
        Allure.add_attachment(name: file_name, source: file, type: Allure::ContentType::PNG, test_case: true)
        return file
    end

    def report_builder
        options = {
            input_path: JSON_PATH,
            report_path: "#{REPORT_PATH}/index",
            report_types: ['retry', 'html', 'json'],
            report_title: 'Mobile e2e tests result',
            additional_info: { 'OS' => OS },
            color: 'blue'
        }
        ReportBuilder.build_report options if File.exists?("#{JSON_PATH}/cucumber.json")
    end

    def wait_present_selenium(mapping, time = 30)
        wait = Selenium::WebDriver::Wait.new(:timeout => time)
        wait.until { $driver.find_elements(mapping).length > 0 }
    end

    def wait_not_present_selenium(mapping, time = 30)
        wait = Selenium::WebDriver::Wait.new(:timeout => time)
        wait.until { $driver.find_elements(mapping).length == 0 }
    end

    def wait_visible(mapping, time = 30)
        Appium::Core::Wait.until_true { $driver.find_elements(mapping).length > 0 }
    end

    def wait_not_visible(mapping, time = 30)
        Appium::Core::Wait.until_true { $driver.find_elements(mapping).length == 0 }
    end

end