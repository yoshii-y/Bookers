class TweetsController < ApplicationController
def top
end

def index
    @tweets=Tweet.all
    @tweet = Tweet.new
    
end


# def new
#     @tweet = Tweet.new
# end




def create
    tweet = Tweet.new(tweet_params)
    tweet.save
    redirect_to "/tweets/#{tweet.id}"
end

def show
    @tweet = Tweet.find(params[:id])
end

def edit
    @tweet = Tweet.find(params[:id])
end


def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to "/tweets/#{tweet.id}"
end



def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
end


    private
    
    def tweet_params
        params.require(:tweet).permit(:title,:body)
    end



end
