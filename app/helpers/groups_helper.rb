module GroupsHelper
  def custom_group?(group)
    unless current_user.default_groups.include?(group.name)
      link_to "Edit", edit_group_path(group.id), class: "text-blue text-sm"
    end
  end
end
