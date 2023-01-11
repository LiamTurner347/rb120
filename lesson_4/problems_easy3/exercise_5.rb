class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer #nomethoderror
tv.model #call model instance method

Television.manufacturer #call manufacturer class method
Television.model #nomethoderror