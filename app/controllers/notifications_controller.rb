class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  def index
    @notifications = Notification.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to notifications_path, notice: "Notification created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @notification.update(notification_params)
      redirect_to notifications_path, notice: "Notification updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path, notice: "Notification deleted successfully."
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

 def notification_params
  params.require(:notification).permit(:title, :body)
        .merge(user_id: current_user.id)
end

end
