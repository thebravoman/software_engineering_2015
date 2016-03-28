  class TaskCheckWorker
  include Sidekiq::Worker

  def perform
    Rails.logger.info(
      "Hello from TaskCheckWorker #{Task.all.map(&:id)}")
  end
end
