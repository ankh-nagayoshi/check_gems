class GemList
  def self.parse(list)
    list.each_line.flat_map do |line|
      line =~ /([\w-]*) \((.*)\)/
      gem_name = $1
      versions = $2.split(', ')
      
      versions.map do |version|
        [gem_name, version]
      end
    end
  end
end
