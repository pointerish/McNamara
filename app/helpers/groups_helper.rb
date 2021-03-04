# rubocop:disable Style/GuardClause

module GroupsHelper
  def custom_group_edit?(group)
    unless current_user.default_groups.include?(group.name)
      link_to 'Edit', edit_group_path(group.id), class: 'text-blue text-sm'
    end
  end

  def custom_group_delete?(group)
    unless current_user.default_groups.include?(group.name)
      link_to 'Delete', group_path(group.id), method: :delete, class: 'text-blue text-sm'
    end
  end
end

# rubocop:enable Style/GuardClause
