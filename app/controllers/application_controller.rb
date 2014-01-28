class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def save_element_structure(jsonObject, parent, level, classInstance)
    order = 1
    jsonObject.each do |item| 
      if item["type"] == "structure"
        curr = classInstance.find(item["id"].to_i)
        curr.parent = parent
        curr.level = level
        curr.order = order
        curr.save

        puts curr.name
        
        order = order + 1

        if item.has_key?("children")
          save_element_structure(item["children"], curr.id, level + 1, classInstance)
        end 
      end
    end
  end
end
