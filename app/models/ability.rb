# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    can :read, TrainingResource

    return if user.nil?

    can [ :read, :update ], User, id: user.id
    return unless user.admin?

    can [ :manage, :edit_role ], User
    can :manage, TrainingResource
  end
end
