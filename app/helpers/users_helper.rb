require 'ruby-graphviz'
require 'fileutils'

module UsersHelper

  IMAGES_PATH = "app/assets/images/usergraphs"

  def self.internal_user_graph_path(user)
    "#{IMAGES_PATH}/#{user.id}.svg"
  end

  def image_for_user_exists?(user)
    File.exists?(Rails.root.join UsersHelper.internal_user_graph_path(user))
  end

  def self.create_user_graph(user)
    g = GraphViz.new( :G, :type => :digraph )
    user_node = g.add_nodes("#{user.username}")
    user.followers.each do |follower|
      follower_node = g.add_nodes("#{follower.username}")
      g.add_edges( follower_node, user_node )
    end
    FileUtils.mkdir_p(IMAGES_PATH)
    file = Rails.root.join UsersHelper.internal_user_graph_path(user)
    g.output( :svg => file )
  end
end
