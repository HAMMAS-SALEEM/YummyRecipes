class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, user_id: user.id

    can :manage, Recipe, user_id: user.id unless user.nil?
    can :manage, Food, user_id: user.id unless user.nil?
  end
end
