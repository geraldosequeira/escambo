class Backoffice::SendMessagesController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    begin
      AdminMailer.send_message(current_admin,
                               params[:recipient],
                               params[:subject],
                               params[:message]).deliver_now

      @notify_message = I18n.t('messages.email_delivered')
      @notify_flag = "success"
    rescue
      @notify_message = I18n.t('messages.email_not_delivered')
      @notify_flag = "error"
    end

    respond_to do |format|
      format.js
    end
  end
end
