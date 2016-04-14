class Rubygem < ActiveRecord::Base
  has_many :versions
  has_many :dependencies
  has_one :linkset
end
