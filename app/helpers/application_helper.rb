module ApplicationHelper
  def build_level(arr)
    ret = ""
    arr.each do |e|
      ret += e.to_s() + "."
    end
    ret
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
