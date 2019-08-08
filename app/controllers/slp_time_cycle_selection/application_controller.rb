module SlpTimeCycleSelection
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    skip_before_action :verify_authenticity_token

    def paginate(objects)
      return unless objects
      paginated_objects = objects.page(params[:page]).per(params[:per_page])

      response.headers['X-SLP-Current-Page'] = paginated_objects.current_page
      response.headers['X-SLP-Total-Pages'] = paginated_objects.total_pages
      response.headers['X-SLP-Total-Count'] = paginated_objects.total_count

      paginated_objects
    end

    def render_json_error(obj = nil)
      if obj.present?
        render json: obj.errors, status: :unprocessable_entity
      else
        render json: MultiJson.dump(errors: ['参数错误']), status: :unprocessable_entity
      end
    end
  end
end
