module Mutations
  class ChangeUserRole < ::Mutations::BaseMutation
    argument :user_id, ID, required: true
    argument :organization_id, String, required: true
    argument :role, Types::RoleType, required: true

    type Types::UserType

    def resolve(attributes)
      ChangeUserRoleService.call(**attributes, acting_user: context[:current_user])
    end
  end
end
