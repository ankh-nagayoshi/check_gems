class Rubygem < ActiveRecord::Base
  has_many :versions
  has_many :dependencies
  has_one :linkset
  
  def invalid_in_lockfile(parsed_lockfile)
    included_dash_gems = parsed_lockfile.specs.select {|s| s.name =~ /-/}.map {|s| [s.name, s.version.to_s]}
    
    included_dash_gems.select do |(name, number)|
      gems = Rubygem.where(name: name)
      return false if gems.blank?
      
      raise "multiple gems -> #{name}" if gems.count > 1
      
      gem = gems.first
      versions = gem.versions.find_by(number: number)
      
      version = case
      when versions.count == 1
        versions.first
      when versions.where(platform: :ruby).exists?
        versions.find_by(platfirm: :ruby)
      else nil
      end
      
      version.try(:dangerous?)
    end
  end
end
