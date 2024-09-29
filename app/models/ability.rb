# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    can :read, TrainingResource
    can [ :read, :update ], User, id: user.id
    return unless user.admin?

    can [ :manage, :edit_roles ], User
    can :manage, TrainingResource
  end
end
