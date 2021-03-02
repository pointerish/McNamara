module ApplicationHelper
  def icon_name(user, group)
    if group.image.attached?
      group.image
    else
      group.icon ? group.icon : 'expense.png'
    end
  end
end
