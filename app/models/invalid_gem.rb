class InvalidGem
  def self.by_lockfile(parsed_lockfile)
    included_dash_gemspecs = parsed_lockfile.specs.select {|s| include_dash?(s.name)}
    included_dash_gems = included_dash_gemspecs.map {|s| [s.name, s.version.to_s]}
    select_dengerous_versions(included_dash_gems)
  end
  
  def self.by_list(gemlist)
    included_dash_gems = gemlist.select {|(g, _)| include_dash?(g)}
    select_dengerous_versions(included_dash_gems)
  end
  
  private
    def self.include_dash?(name)
      name =~ /-/
    end
    
    def self.select_dengerous_versions(gemlist)
      gemsets = gemlist.map {|(na, nu)| [Rubygem.where(name: na), nu]}
      gemsets = gemsets.reject {|(g, _)| g.blank? || g.count > 1}
      gemsets = gemsets.map {|(g, n)| [g.first, n]}
      gemsets.map do |(_gem, number)|
        versions = _gem.versions.where(number: number)
        
        version = case
        when versions.count == 1
          versions.first
        when versions.where(platform: :ruby).exists?
          versions.find_by(platform: :ruby)
        else
          nil
        end
        
        if version.try(:dangerous?)
          [_gem.name, number, version.created_at, _gem.linkset.try(:github)]
        else
          nil
        end
      end.compact
    end
end
