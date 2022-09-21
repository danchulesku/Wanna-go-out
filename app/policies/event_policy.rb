class EventPolicy < ApplicationPolicy

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    @record.user == user
  end

  def show?
    pincode_guard
  end

  private

  def pincode_guard
    return true if @record.pincode.blank?
    return true if user == @record.user

    # Проверяем, верный ли в куках пин-код
    @record.pincode_valid?(cookies["events_#{@record.id}_pincode"])
  end
end
