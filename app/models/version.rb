class Version < ActiveRecord::Base
  belongs_to :rubygem
  has_many :version_histories
  has_many :dependencies
  
  default_scope ->{ order number: :desc }
  
  def dangerous?
    (created_at >= Time.utc(2014, 6, 11)) && (created_at <= Time.utc(2015, 2, 18))
  end
end
