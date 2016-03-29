class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.write?
      # Entry
      can :create, Entry do |entry|
        entry.user == user
      end
    elsif user.read?
      # Entry
      cannot :create, Entry
    end
  end
end
