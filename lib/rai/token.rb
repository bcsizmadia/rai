# frozen_string_literal: true

module Token
  @access_token = ""
  @token_file = File.join(Dir.home, "/.rai/token")

  def self.create_token
    print "Please enter your access token: "
    @access_token = gets.chomp

    FileUtils.mkdir_p(File.dirname(@token_file))
    File.write(@token_file, @access_token)
  end

  def self.check_token
    if File.exist?(@token_file)
      @access_token = File.read(@token_file).chomp
    else
      create_token
    end
  end
end
