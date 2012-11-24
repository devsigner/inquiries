require 'rails/generators'
require 'rails/generators/active_record'

class InquiriesGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def copy_files(*args)
    migration_template 'create_inquiries.rb', 'db/migrate/create_inquiries.rb'
  end
end
