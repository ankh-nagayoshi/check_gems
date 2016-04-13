module ApplicationHelper
  def rubygems_org_url(gem_name: nil, version: nil)
    gem_name_path = gem_name ? "gems/#{gem_name}/" : ""
    versions_path = version ? "versions/#{version}/" : ""
    "https://rubygems.org/#{gem_name_path}#{versions_path}"
  end
end
