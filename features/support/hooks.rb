$isFirstRun = true

Before do
    $driver.start_driver unless $isFirstRun
    $isFirstRun = false
end

Before do |_scenario|
    
end

After do |scenario|
    attach(Util.new.save_image(scenario.name), 'image/png') if scenario.failed?    
end

After do |scenario|
    $driver.driver_quit
end

at_exit do
    begin
        Util.new.report_builder
    rescue IOError => e
        fail("Oops!\nThe report generation have failed.\n#{e.message}")
    end
end