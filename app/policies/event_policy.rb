class EventPolicy < ApplicationPolicy

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    @record.user == @user.user
  end

  def show?
    pincode_guard
  end

  private

  def pincode_guard
    return true if @record.pincode.blank?
    return true if @user.user == @record.user

    if @user.pincode.present? && @record.pincode_valid?(@user.pincode)
      @user.cookies.permanent["events_#{@record.id}_pincode"] = @user.pincode
    end

    # Проверяем, верный ли в куках пин-код
    if @record.pincode_valid?(@user.cookies.permanent["events_#{@record.id}_pincode"])
      true
    end
  end
end
