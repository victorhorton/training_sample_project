# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    can :read, TrainingResource

    return unless user.admin?

    can :manage, TrainingResource
  end
end
