#app/controllers/api/api_controller.rb
class Api::ApiController < ActionController::Metal
include ActionController::UrlFor
include ActionController::Rendering
include ActionController::Renderers::All
include ActionController::ConditionalGet
include ActionController::MimeResponds
include ActionController::Rescue
include ActionController::Instrumentation
include Rails.application.routes.url_helpers
append_view_path "#{Rails.root}/app/views"

	respond_to :json
		p "**************************"
		p "**************************"
		p "**************************"
		p "**************************"
		p DB_SEQUEL
		p "**************************"
		p "**************************"
		p "**************************"
		p "**************************"
		p "**************************"
		p "**************************"

end
 

# class Api::BaseController < ActionController::Metal
# include ActionController::UrlFor
# include ActionController::Rendering
# include ActionController::Renderers::All
# include ActionController::ConditionalGet
# include ActionController::MimeResponds
# include ActionController::Rescue
# include ActionController::Instrumentation
# include Rails.application.routes.url_helpers
# append_view_path "#{Rails.root}/app/views"
# respond_to :json
# end