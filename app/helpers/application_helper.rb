#coding: utf-8
module ApplicationHelper

  def resource_name_to_title(resource_name)
    case resource_name
    when :admin
      '管理者'
    when :investor
      '企業'
    else
      '起業家'
    end
  end

  def current_actor
    if current_admin
      current_admin
    elsif current_investor
      current_investor
    elsif current_user
      current_user
    end
  end

  def current_actor_name
    current_actor.class.to_s.downcase
  end

end
