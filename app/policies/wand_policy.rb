class WandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    #if the user is the owner of the restuarant then it should be true
    # otherwise it should be false
    # user = current_user
    # record = @wand (argument passed to authorize)
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user || user.admin
  end
end
