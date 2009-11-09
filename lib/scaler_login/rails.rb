# Rails.configuration.after_initialize do
#   if defined?(ActiveRecord)
#     ActiveRecord::Base.extend ScalerLogin::Models
#     # ActiveRecord::ConnectionAdapters::TableDefinition.send :include, Devise::Migrations
#   end
# end