class MailerJob < ApplicationJob
  queue_as :default

  def perform(object, action)
    @object = object
    municipe_create       if action.to_s.eql? 'municipe_create'
    municipe_update       if action.to_s.eql? 'municipe_update'
  end

  private

  def municipe_create
    MunicipeMailer.municipe_created(@object).deliver
  end

  def municipe_update
    MunicipeMailer.municipe_updated(@object).deliver
  end

end
