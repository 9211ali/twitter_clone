class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = current_user.tweets.create(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html {  redirect_to dashboard_path, notice: 'Tweet was successfully created' }
        format.turbo_stream
      end
    else
      redirect_to dashboard_path, alert: @tweet.errors.full_messages.join
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
