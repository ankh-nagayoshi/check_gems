class InvalidGem
  def self.by_lockfile(parsed_lockfile)
    included_dash_gems = parsed_lockfile.specs.select {|s| include_dash?(s.name)}.map {|s| [s.name, s.version.to_s]}
    
    select_dengerous_versions(included_dash_gems)
  end
  
  def self.by_list(gemlist)
    included_dash_gems = gemlist.select {|(g, v)| include_dash?(g)}
    select_dengerous_versions(included_dash_gems)
  end
  
  private
    def self.include_dash?(name)
      name =~ /-/
    end
    
    def self.select_dengerous_versions(gemlist)
      gemlist.map do |(name, number)|
        gems = Rubygem.where(name: name)
        return false if gems.blank?
        
        raise "multiple gems -> #{name}" if gems.count > 1
        
        gem = gems.first
        versions = gem.versions.where(number: number)
        
        version = case
        when versions.count == 1
          versions.first
        when versions.where(platform: :ruby).exists?
          versions.find_by(platform: :ruby)
        else
          nil
        end
        
        if version.try(:dangerous?)
          [name, number, version.created_at, gem.linkset.try(:github)]
        else
          nil
        end
      end.compact
    end
end
