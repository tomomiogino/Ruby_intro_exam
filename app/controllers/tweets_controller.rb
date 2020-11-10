class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show]
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを作成しました！"
    else
      render :new
    end
  end
  def show
  end
  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
