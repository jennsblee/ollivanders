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

  def approve?
    owner_or_admin?
  end

  def decline?
    owner_or_admin?
  end

  private

  def renter_or_admin_or_owner?
    user == record.user || user.admin || record.wand.user
  end

  def owner_or_admin?
    user == record.wand.user || user.admin
  end
end
