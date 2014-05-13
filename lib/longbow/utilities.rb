$:.push File.expand_path('../', __FILE__)

module Longbow
  # Strip Non-Alphanumerics
  def self.stripped_text text
    return text.gsub(/[^0-9a-z ]/i, '')
  end
end