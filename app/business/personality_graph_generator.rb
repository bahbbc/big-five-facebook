class PersonalityGraphGenerator

  def initialize(personalities)
    @personalities = personalities
  end

  def spider_graph
    g = Gruff::Spider.new(5)
    g.title = " "
    g.theme = Gruff::Themes::THIRTYSEVEN_SIGNALS
    normalize.each do |data|
      g.data(data[0], data[1])
    end
    g.write("app/assets/images/personality-graph-#{@personalities.user_id}.png")
    #Cloudinary::Uploader.upload("tmp/personality-graph-#{@personalities.user_id}.png", public_id: "graph-#{@personalities.user_id}")
  end

  private

  def normalize
    @personalities.attributes.except("created_at", "updated_at", "id", "user_id").to_a.each do |el|
      el[1] = [el[1]]
    end
  end

end
