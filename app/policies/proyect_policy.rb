class ProyectPolicy < ApplicationPolicy
    attr_reader :user, :proyect


    def initialize(user,experience)
        @user = user.nil? ? false : user.admin?
        @experience = experience
    end

    def create?
        @user
    end

    def new?
        @user
    end

    def edit?
        @user
    end
    
    def index?
        @user
    end
    
    def update?
        @user
    end
    
    def destroy?
        @user
    end
end
