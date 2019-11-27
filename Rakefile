#require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:execute_features) do |t|
    t.cucumber_opts = "-q --format html --out=./results/features_report.html" # Any valid command line option can go here.
    # or we could use a profile from our cucumber.yml file:
    #t.profile = "default"
end
