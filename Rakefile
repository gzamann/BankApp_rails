# frozen_string_literal: true

require_relative 'config/application'

Rails.application.load_tasks

if defined?(RSpec)
  desc 'Run factory specs.'
  RSpec::Core::RakeTask.new(:factory_specs) do |t|
    t.pattern = './spec/factories_spec.rb'
  end
end

task spec: :factory_specs
