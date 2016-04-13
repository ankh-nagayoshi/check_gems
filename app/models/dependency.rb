class Dependency < ActiveRecord::Base
  belongs_to :version
  belongs_to :rubygem
end
