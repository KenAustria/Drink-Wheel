class Admin::BaseController < ApplicationController
	before_filter :wrap_site_in_basic_auth
	layout 'admin'

	def wrap_site_in_basic_auth
		authenticate_or_request_with_http_basic do |user_name, password | #user_name == "KennPangilinan" && password == "Toodaloo"
		user_name == "a" && password == "a"
	end
end