desc "run all tests with allure -p not_wip"
task :test do
    sh "bundle exec cucumber -p pretty -p allure"
end

desc "run tagged tests with allure"
task :tags do
    sh "bundle exec cucumber -p pretty -p allure -p not_wip --tags ${TAGS}"
end

desc "Report-allure"
task :allure do
    puts "Generating allure report"
    sh "allure serve report/"
end

desc "Run all tests with report builder"
task :test_report do
    sh "bundle exec cucumber -p pretty -p json -p not_wip"
end

desc "Run tagged tests with report builder"
task :tags_report do
    sh "bundle exec cucumber -p pretty -p json -p not_wip --tags ${TAGS}"
end

desc "Report-report_builder"
task :report do
    sh "google-chrome report/index.html"
end

desc "Wip tests"
task :wip do
    puts "Running tests with @wip tags"
    sh "bundle exec cucumber -p pretty -p allure -p json"
end