class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    renter_or_admin_or_owner?
  end

  def destroy?
    renter_or_admin_or_owner?
  end

  private

  def renter_or_admin_or_owner?
    user == record.user || user.admin || record.wand.user
  end
end
