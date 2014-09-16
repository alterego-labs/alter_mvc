module AlterMvc
  ##
  # A use case describes a sequence of actions that provide something
  # of measurable value to an user. This equals one item on USE-CASE diagram
  # that is drawn as a horizontal ellipse.
  #
  # ==== Example
  #
  # Imagine something like use-case in your system: user can subscribe to
  # another user. To our use-case class we may pass either users instances or
  # their ids. I prefer second case. Our class may be like follows:
  # # class User::Subscribe < AlterMvc::UseCase
  # #   attr_reader :source_id, :subscriber_id
  # #   def execute
  # #     create_subscription
  # #     notify_source
  # #   end
  # #   private
  # #   def create_subscription
  # #     Subscription.create source_id, subscriber_id
  # #   end
  # #   def notify_source
  # #     SubscribeMailer.new_subscriber(source_id, subscriber_id).deliver
  # #   end
  # # end
  # And now somewhere in our controller we may use just defined class:
  # # class UserController < ApplicationController
  # #   def subscribe
  # #     source_id = params[:source_id]
  # #     subscriber_id = params[:subscriber_id]
  # #     User::Subscribe.new(
  # #       source_id: source_id,
  # #       subscriber_id: subscriber_id).execute
  # #     redirect_to :back, notice: 'Successfully subscribed!'
  # #   end
  # # end
  class UseCase < AlterMvc::Helpers::BaseCommand
  end
end