module GroupsHelper
  
  
  def image_for(group, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest("mackieg@umich.edu")
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: group.name, class: "gravatar")
  end

end
