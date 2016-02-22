class User < ActiveRecord::Base
has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing_profile_avatar.png"
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

has_secure_password

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

end