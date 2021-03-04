module ApplicationHelper
  def icon_name(_user, group)
    return 'expense.png' if group.nil?

    if group.image.attached?
      group.image
    else
      group.icon || 'expense.png'
    end
  end
end
