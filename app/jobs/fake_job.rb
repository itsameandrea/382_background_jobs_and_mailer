class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # send an email

    # upload a youtube video

    # connect to an API
    puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end
