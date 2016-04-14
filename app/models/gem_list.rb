class GemList
  def self.parse(list)
    list.each_line.map {|l| l.match(/([\w-]*) \((.*)\)/)}.compact.flat_map do |match_data|
      match_data[2].split(', ').map {|v| [match_data[1], v]}
    end
  end
end
