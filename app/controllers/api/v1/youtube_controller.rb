class Api::V1::YoutubeController < ApplicationController
  def search
    if params[:keyword].blank?
      render json: { error: t("params error") }, status: 400
      return
    end
    @result = YoutubeSearch.new params[:keyword], params[:page_token]
  end

  def video
    if params[:id].blank?
      render json: { error: t("params error") }, status: 400
      return
    end
    @video = YoutubeVideo.new params[:id]
  end
end
