class Ability
  include CanCan::Ability

  def initialize(user)
   
         user ||= User.new # guest user (not logged in)
       if user.role.name == "adminstrator"
         can :manage, :all
       elsif user.role.name == "user"
         can :read, :all
       end
    
  end
end
