class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = current_user.tweets.create(tweet_params)
    if @tweet.save!
      redirect_to dashboard_path
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
