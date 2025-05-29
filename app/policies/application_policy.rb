# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    staff_or_higher?
  end

  def show?
    staff_or_higher?
  end

  def create?
    admin_or_higher?
  end

  def new?
    create?
  end

  def update?
    admin_or_higher?
  end

  def edit?
    update?
  end

  def destroy?
    superadmin?
  end

  private

  def staff_or_higher?
    user.staff? || user.admin? || user.superadmin?
  end

  def admin_or_higher?
    user.admin? || user.superadmin?
  end

  def superadmin?
    user.superadmin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
