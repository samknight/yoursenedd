class Members::SpeechesController < ApplicationController
  respond_to :json
  before_filter :authorize_call
  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
  render json: 'Unauthorized', status: 401
  end

  def index
    @member = Member.find_by!(id: params[:member_id])
    @debates = @member.debates.order('log_date DESC').group('debates.id').limit(3)
    @speeches = @debates.collect { |d| d.speeches.find_by(member_id: @member.id) }

    render :index, layout: nil
  end

  protected

  def authorize_call
    ApiKey.find_by!(uuid: params[:uuid], member_id: params[:member_id])
  end
end
