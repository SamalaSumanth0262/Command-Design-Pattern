class Core::CreateUserCommand < Core::Command
  attr_reader :user_params

  def initialize(params)
    super(params)
    @user_params = params
  end

  def run
    ActiveRecord::Base.transaction do
      authenticate_user
      mailer("Account Created")
      award_points
      send_push_notification
      mailer("User Logged In")
    end
    # can be written in JSON builder a seprate file
    return { name: "Samala Sumanth", git: "https://github.com/SamalaSumanth0262"}
  end

  def authenticate_user
    # can be separate command for user authentication
    puts "User Authenticated"
  end

  def mailer(message)
    # can be separate command for mailer
    puts message
  end
  
  def award_points
    # can be written in separate command for awarding points
    puts "User has been awarded 10 points"
  end

  def send_push_notification
    # User Notification Command
    puts "User has been sent push notification"
  end
end