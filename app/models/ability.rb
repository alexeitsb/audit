class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.write?
      # Entry
      can [:create, :read], Entry
      can [:update, :destroy], Entry do |entry|
        entry.user == user
      end
      # Attachment
      can :manage, Attachment do |attachment|
        attachment.entry.user == user
      end
    elsif user.read?
      # Entry
      cannot :create, Entry
    end
  end
end


# :create, :read, :update, :destroy