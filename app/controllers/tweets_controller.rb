class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :set_new_tweet, only: [:create, :confirm]
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end
  def new
    @tweet = Tweet.new
  end
  def create
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "ツイートを作成しました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました！"
  end
  def confirm
    render :new if @tweet.invalid?
  end
  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def set_new_tweet
    @tweet = Tweet.new(tweet_params)
  end
end
