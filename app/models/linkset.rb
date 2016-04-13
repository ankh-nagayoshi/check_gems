class Linkset < ActiveRecord::Base
  belongs_to :rubygem
  
  def github
    baseurl = [home, wiki, docs, code, bugs].find {|url| url =~ /github\.com/}
    baseurl.sub(/^https?:/, "https:") if baseurl
  end
end
