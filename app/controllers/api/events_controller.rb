class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_access_control_headers


  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    event_params = JSON.parse(request.body.read)
    application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if application.nil?
      render json: 'Unregistered application', status: :unprocessable_entity
    else
      @event = application.events.build(name: event_params['name'])
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  def preflight
    head 200
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end
