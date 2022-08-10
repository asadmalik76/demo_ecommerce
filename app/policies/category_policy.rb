# frozen_string_literal: true

# Cetegory Policy Definition
class CategoryPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.has_role? :seller
  end

  def show?
    user.has_role? :seller
  end

  def create?
    user.has_role? :seller
  end

  def new?
    user.has_role? :seller
  end

  def update?
    user.has_role? :seller
  end

  def edit?
    user.has_role? :seller
  end

  def destroy?
    user.has_role? :seller
  end

  # Category Policy Scope
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
