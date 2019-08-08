module SlpTimeCycleSelection
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def paginate(objects)
      return unless objects
      paginated_objects = objects.page(params[:page]).per(params[:per_page])

      response.headers['X-SLP-Current-Page'] = paginated_objects.current_page
      response.headers['X-SLP-Total-Pages'] = paginated_objects.total_pages
      response.headers['X-SLP-Total-Count'] = paginated_objects.total_count

      paginated_objects
    end
  end
end
