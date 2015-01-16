class ApiServersController < BaseApiController
  before_filter :find_server, only: [:show, :update]

  before_filter only: :create do
    unless @json.has_key?('server') && @json['server'].responds_to?(:[]) && @json['server']['name']
      render nothing: true, status: :bad_request
    end
  end

  before_filter only: :update do
    unless @json.has_key?('server')
      render nothing: true, status: :bad_request
    end
  end

  before_filter only: :create do
    @server = Server.find_by_name(@json['server']['name'])
  end

  def index
    render json: Server.where('owner_id = ?', @user.id)
  end

  def show
    render json: @server
  end

  def create
    if @server.present?
      render nothing: true, status: :conflict
    else
      @server = Server.new
      @server.assign_attributes(@json['server']
      if @server.save
        render json: @server
      else
         render nothing: true, status: :bad_request
      end
    end
  end

  def update
    @server.assign_attributes(@json['server'])
    if @server.save
        render json: @server
    else
        render nothing: true, status: :bad_request
    end
  end

 private
   def find_server
     @server = Server.find_by_name(params[:name])
     render nothing: true, status: :not_found unless @server.present? && @server.user == @user
   end
 end