class Activity < ActiveRecord::Base
  belongs_to :log, polymorphic: true
end